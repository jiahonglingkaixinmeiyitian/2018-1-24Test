//
//  LXStore.m
//  linktrustEduTeacher
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 linktrust. All rights reserved.
//

#import "LXStore.h"

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabaseQueue.h"

#ifdef DEBUG
#define debugLog(...)    NSLog(__VA_ARGS__)
#define debugMethod()    NSLog(@"%s", __func__)
#define debugError()     NSLog(@"Error at %s Line:%d", __func__, __LINE__)
#else
#define debugLog(...)
#define debugMethod()
#define debugError()
#endif

#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#pragma mark - 类 -LXStoreItem

@implementation LXStoreItem

- (NSString *)description
{
    return [NSString stringWithFormat:@"id=%@, value=%@, timeStamp=%@", _itemId, _itemObject, _createdTime];
}

@end


#pragma mark - 类 -LXStore

@interface LXStore()
@property (strong, nonatomic) FMDatabaseQueue *dbQueue;
@end
@implementation LXStore

#pragma mark - SQL语句 & 数据库 常量

/* 默认的存储文件名，使用init初始化 */
static NSString *const DEFAULT_DB_NAME = @"database.sqlite";


static NSString *const CREATE_TABLE_SQL =
@"CREATE TABLE IF NOT EXISTS %@ ( \
id TEXT NOT NULL, \
json TEXT NOT NULL, \
createdTime TEXT NOT NULL, \
PRIMARY KEY(id)) \
";

static NSString *const UPDATE_ITEM_SQL = @"REPLACE INTO %@ (id, json, createdTime) values (?, ?, ?)";

static NSString *const QUERY_ITEM_SQL = @"SELECT json, createdTime from %@ where id = ? Limit 1";

static NSString *const SELECT_ALL_SQL = @"SELECT * from %@";

static NSString *const COUNT_ALL_SQL = @"SELECT count(*) as num from %@";

static NSString *const CLEAR_ALL_SQL = @"DELETE from %@";

static NSString *const DELETE_ITEM_SQL = @"DELETE from %@ where id = ?";

static NSString *const DELETE_ITEMS_SQL = @"DELETE from %@ where id in ( %@ )";

static NSString *const DELETE_ITEMS_WITH_PREFIX_SQL = @"DELETE from %@ where id like ? ";

static NSString *const DROP_TABLE_SQL = @" DROP TABLE '%@' "; //清除表格

#pragma mark - 私有方法

/**
 检查名字是否合法
 
 @param tableName 表名
 @return          YES：合法
 */
+ (BOOL)checkTableName:(NSString *)tableName
{
    
    if (tableName == nil ||
        tableName.length == 0 ||
        [tableName rangeOfString:@" "].location != NSNotFound) //有空格
    {
        debugLog(@"ERROR, table name: %@ format error.", tableName);
        return NO;
    }
    
    return YES;
}



#pragma mark - 接口：打开（或创建）数据库

/**
 使用默认文件名字创建数据库
 
 @return KeyValueStore对象
 */
- (id)init
{
    return [self initDBWithName:DEFAULT_DB_NAME];
}

/**
 在程序的Document目录打开指定的数据库文件。
 如果该文件不存在，则会创建一个新的数据库。
 
 @param dbName 存储的文件名字  eg：@"user.db"
 @return       KeyValueStore对象
 */
- (id)initDBWithName:(NSString *)dbName
{
    if (self = [super init]) {
        
        NSString *dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:dbName];
        debugLog(@"dbPath = %@", dbPath);
        if (_dbQueue) {
            [self close];
        }
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    
    return self;
}

/**
 创建/打开指定路径的数据库文件。
 如果该文件不存在，则会根据路径dbPath创建一个新的数据库。
 
 @param dbPath 存储的文件名字
 @return       KeyValueStore对象
 */
- (id)initWithDBWithPath:(NSString *)dbPath
{
    
    if (self = [super init]) {
        debugLog(@"dbPath = %@", dbPath);
        if (_dbQueue) {
            [self close];
        }
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    
    return self;
}

/**
 在打开的数据库中创建表
 如果表名已经存在，则会忽略该操作
 
 @param tableName 表名 eg：@"user_table"
 */
- (void)createTableWithName:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    NSString * sql = [NSString stringWithFormat:CREATE_TABLE_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to create table: %@", tableName);
    }
}

/**
 是否存在表
 
 @param tableName 表名
 @return          YES：存在
 */
- (BOOL)isTableExists:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return NO;
    }
    
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db tableExists:tableName];
    }];
    if (!result) {
        debugLog(@"ERROR, table: %@ not exists in current DB", tableName);
    }
    return result;
}


/**
 清除数据库中 表名为 tableName 的表
 
 @param tableName 表名
 */
- (void)dropTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    NSString *sql = [NSString stringWithFormat:DROP_TABLE_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to drop table: %@", tableName);
    }
}


#pragma mark - 接口：写数据

/**
 key-value的存储接口
 value支持：NSString, NSNumber, NSDictionary和NSArray
 */


/**
 数据&key&表名 - 写入数据 NSString
 
 @param string    数据 NSString
 @param stringId  key
 @param tableName 表名
 */
- (void)putString:(NSString *)string withId:(NSString *)stringId intoTable:(NSString *)tableName
{
    if (string == nil) {
        debugLog(@"error, string is nil");
        return;
    }
    [self putObject:@[string] withId:stringId intoTable:tableName];
}

/**
 数据&key&表名 - 写入数据 NSNumber
 
 @param number    数据 NSNumber
 @param numberId  key
 @param tableName 表名
 */
- (void)putNumber:(NSNumber *)number withId:(NSString *)numberId intoTable:(NSString *)tableName
{
    if (number == nil) {
        debugLog(@"error, number is nil");
        return;
    }
    [self putObject:@[number] withId:numberId intoTable:tableName];
}

/**
 数据&key&表名 - 写入数据 NSDictionary / NSArray
 
 @param object    数据 NSDictionary / NSArray
 @param objectId  key
 @param tableName 表名
 */
- (void)putObject:(id)object withId:(NSString *)objectId intoTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    
    NSError * error;
    NSData * data = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    if (error) {
        debugLog(@"ERROR, faild to get json data");
        return;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:(NSUTF8StringEncoding)];
    NSDate *createdTime = [NSDate date];
    NSString * sql = [NSString stringWithFormat:UPDATE_ITEM_SQL, tableName];
    
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql, objectId, jsonString, createdTime];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to insert/replace into table: %@", tableName);
    }
}

#pragma mark - 接口：读数据


/**
 表名&key值 - 读取数据 NSString
 
 @param stringId  key值
 @param tableName 表名
 @return          数据 NSString
 */
- (NSString *)getStringById:(NSString *)stringId fromTable:(NSString *)tableName
{
    NSArray * array = [self getObjectById:stringId fromTable:tableName];
    
    if (array && [array isKindOfClass:[NSArray class]]) {
        return array[0];
    }
    
    return nil;
}


/**
 表名&key值 - 读取数据 NSNumber
 
 @param numberId  key值
 @param tableName 表名
 @return          数据 NSNumber
 */
- (NSNumber *)getNumberById:(NSString *)numberId fromTable:(NSString *)tableName
{
    NSArray *array = [self getObjectById:numberId fromTable:tableName];
    
    if (array && [array isKindOfClass:[NSArray class]]) {
        return array[0];
    }
    
    return nil;
}


/**
 表名&key值 - 读取数据 NSDictionary / NSArray
 
 @param objectId  key值
 @param tableName 表名
 @return          数据 NSDictionary / NSArray
 */
- (id)getObjectById:(NSString *)objectId fromTable:(NSString *)tableName
{
    LXStoreItem *item = [self getStoreItemById:objectId fromTable:tableName];
    
    if (item) {
        return item.itemObject;
    } else {
        return nil;
    }
}


/**
 根据表名tableName - 获取该表中的所有的数据
 
 @param tableName 表名
 @return          数组（元素：StoreItem对象）
 */
- (NSArray *)getAllItemsFromTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return nil;
    }
    
    NSString *sql = [NSString stringWithFormat:SELECT_ALL_SQL, tableName];
    __block NSMutableArray *result = [NSMutableArray array];
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql];
        
        while ([rs next]) {
            
            LXStoreItem *item = [[LXStoreItem alloc] init];
            item.itemId = [rs stringForColumn:@"id"];
            item.itemObject = [rs stringForColumn:@"json"];
            item.createdTime = [rs dateForColumn:@"createdTime"];
            
            [result addObject:item];
        }
        
        [rs close];
    }];
    
    // 解析 json
    NSError *error;
    for (LXStoreItem *item in result) {
        
        error = nil;
        id object = [NSJSONSerialization JSONObjectWithData:[item.itemObject dataUsingEncoding:NSUTF8StringEncoding] options:(NSJSONReadingAllowFragments) error:&error];
        
        if (error) {
            debugLog(@"ERROR, faild to prase to json.");
        } else {
            item.itemObject = object;
        }
    }
    
    return result;
}


/**
 根据表名 - 获取数据条数
 
 @param tableName 表名
 @return          条数
 */
- (NSUInteger)getCountFromTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return 0;
    }
    
    NSString * sql = [NSString stringWithFormat:COUNT_ALL_SQL, tableName];
    __block NSInteger num = 0;
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        
        FMResultSet * rs = [db executeQuery:sql];
        if ([rs next]) {
            num = [rs unsignedLongLongIntForColumn:@"num"];
        }
        
        [rs close];
    }];
    
    return num;
}


/**
 查找数据库数据 -> 生成 LXStoreItem 对象
 
 @param objectId  id
 @param tableName 表名
 @return          LXStoreItem 对象
 */
- (LXStoreItem *)getStoreItemById:(NSString *)objectId fromTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return nil;
    }
    
    NSString *sql = [NSString stringWithFormat:QUERY_ITEM_SQL, tableName];
    
    __block NSString *json = nil;
    __block NSDate *createdTime = nil;
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:sql, objectId];
        
        if ([rs next]) {
            json = [rs stringForColumn:@"json"];
            createdTime = [rs dateForColumn:@"createdTime"];
        }
        
        [rs close];
    }];
    
    if (json) {
        NSError * error;
        id result = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:(NSJSONReadingAllowFragments) error:&error];
        if (error) {
            debugLog(@"ERROR, faild to prase to json");
            return nil;
        }
        
        LXStoreItem * item = [[LXStoreItem alloc] init];
        item.itemId = objectId;
        item.itemObject = result;
        item.createdTime = createdTime;
        
        return item;
        
    } else {
        return nil;
    }
}

#pragma mark - 接口：删除数据


/**
 清除数据表中所有数据
 
 @param tableName 表名
 */
- (void)clearTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    NSString * sql = [NSString stringWithFormat:CLEAR_ALL_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to clear table: %@", tableName);
    }
}


/**
 删除指定key的数据
 
 @param objectId  key
 @param tableName 表名
 */
- (void)deleteObjectById:(NSString *)objectId fromTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    NSString * sql = [NSString stringWithFormat:DELETE_ITEM_SQL, tableName];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql, objectId];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to delete item from table: %@", tableName);
    }
}


/**
 批量删除一组key数组的数据
 
 @param objectIdArray key值数组（数组元素是要删除的key对应的数据）
 @param tableName     表名
 */
- (void)deleteObjectsByIdArray:(NSArray *)objectIdArray fromTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    NSMutableString *stringBuilder = [NSMutableString string];
    for (id objectId in objectIdArray) {
        NSString *item = [NSString stringWithFormat:@" '%@' ", objectId];
        if (stringBuilder.length == 0) {
            [stringBuilder appendString:item];
        } else {
            [stringBuilder appendString:@","];
            [stringBuilder appendString:item];
        }
    }
    NSString *sql = [NSString stringWithFormat:DELETE_ITEMS_SQL, tableName, stringBuilder];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to delete items by ids from table: %@", tableName);
    }
}


/**
 批量删除所有带指定前缀的数据
 
 @param objectIdPrefix 指定前缀
 @param tableName      表名
 */
- (void)deleteObjectsByIdPrefix:(NSString *)objectIdPrefix fromTable:(NSString *)tableName
{
    if ([LXStore checkTableName:tableName] == NO) {
        return;
    }
    NSString *sql = [NSString stringWithFormat:DELETE_ITEMS_WITH_PREFIX_SQL, tableName];
    NSString *prefixArgument = [NSString stringWithFormat:@"%@%%", objectIdPrefix];
    __block BOOL result;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        result = [db executeUpdate:sql, prefixArgument];
    }];
    if (!result) {
        debugLog(@"ERROR, failed to delete items by id prefix from table: %@", tableName);
    }
}

#pragma mark - 接口：关闭数据库 队列

- (void)close
{
    [_dbQueue close];
    _dbQueue = nil;
}

@end

