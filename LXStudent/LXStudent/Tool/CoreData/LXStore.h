//
//  LXStore.h
//  linktrustEduTeacher
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 linktrust. All rights reserved.
//

/*
 * 本地数据库缓存 Key-Value
 *
 */

#import <Foundation/Foundation.h>


@interface LXStoreItem : NSObject

/**
 key-value ： id-itemId
 */
@property (strong, nonatomic) NSString *itemId;

/**
 key-value： json-itemObject
 @[NSString], @[NSNumber], NSDictionary和NSArray
 */
@property (strong, nonatomic) id itemObject;

/**
 key-value： createdTime-createdTime
 该条数据的插入（或更新）时间
 */
@property (strong, nonatomic) NSDate *createdTime;
@end


@interface LXStore : NSObject
#pragma mark - 接口：打开（或创建）数据库

/**
 在程序的Document目录打开指定的数据库文件。
 如果该文件不存在，则会创建一个新的数据库。
 
 @param dbName 存储的文件名字  eg：@"test.db"
 @return       KeyValueStore对象
 */
- (id)initDBWithName:(NSString *)dbName;

/**
 创建/打开指定路径的数据库文件。
 如果该文件不存在，则会根据路径dbPath创建一个新的数据库。
 
 @param dbPath 存储的文件名字
 @return       KeyValueStore对象
 */
- (id)initWithDBWithPath:(NSString *)dbPath;

/**
 在打开的数据库中创建表
 如果表名已经存在，则会忽略该操作
 
 @param tableName 表名 eg：@"user_table"
 */
- (void)createTableWithName:(NSString *)tableName;


/**
 是否存在表
 
 @param tableName 表名
 @return          YES：存在
 */
- (BOOL)isTableExists:(NSString *)tableName;




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
- (void)putString:(NSString *)string withId:(NSString *)stringId intoTable:(NSString *)tableName;

/**
 数据&key&表名 - 写入数据 NSNumber
 
 @param number    数据 NSNumber
 @param numberId  key
 @param tableName 表名
 */
- (void)putNumber:(NSNumber *)number withId:(NSString *)numberId intoTable:(NSString *)tableName;

/**
 数据&key&表名 - 写入数据 NSDictionary / NSArray
 
 @param object    数据 NSDictionary / NSArray
 @param objectId  key
 @param tableName 表名
 */
- (void)putObject:(id)object withId:(NSString *)objectId intoTable:(NSString *)tableName;

#pragma mark - 接口：读数据


/**
 表名&key值 - 读取数据 NSString
 
 @param stringId  key值
 @param tableName 表名
 @return          数据 NSString
 */
- (NSString *)getStringById:(NSString *)stringId fromTable:(NSString *)tableName;


/**
 表名&key值 - 读取数据 NSNumber
 
 @param numberId  key值
 @param tableName 表名
 @return          数据 NSNumber
 */
- (NSNumber *)getNumberById:(NSString *)numberId fromTable:(NSString *)tableName;


/**
 表名&key值 - 读取数据 NSDictionary / NSArray
 
 @param objectId  key值
 @param tableName 表名
 @return          数据 NSDictionary / NSArray
 */
- (id)getObjectById:(NSString *)objectId fromTable:(NSString *)tableName;


/**
 查找数据库数据 -> 生成 StoreItem 对象
 
 @param objectId  id
 @param tableName 表名
 @return          StoreItem 对象
 */
- (LXStoreItem *)getStoreItemById:(NSString *)objectId fromTable:(NSString *)tableName;

/**
 根据表名tableName - 获取该表中的所有的数据
 
 @param tableName 表名
 @return          数组（元素：StoreItem对象）
 */
- (NSArray *)getAllItemsFromTable:(NSString *)tableName;

/**
 根据表名 - 获取数据条数
 
 @param tableName 表名
 @return          条数
 */
- (NSUInteger)getCountFromTable:(NSString *)tableName;



#pragma mark - 接口：删除数据


/**
 清除数据表中所有数据
 
 @param tableName 表名
 */
- (void)clearTable:(NSString *)tableName;


/**
 删除指定key的数据
 
 @param objectId  key
 @param tableName 表名
 */
- (void)deleteObjectById:(NSString *)objectId fromTable:(NSString *)tableName;


/**
 批量删除一组key数组的数据
 
 @param objectIdArray key值数组（数组元素是要删除的key对应的数据）
 @param tableName     表名
 */
- (void)deleteObjectsByIdArray:(NSArray *)objectIdArray fromTable:(NSString *)tableName;


/**
 批量删除所有带指定前缀的数据
 
 @param objectIdPrefix 指定前缀
 @param tableName      表名
 */
- (void)deleteObjectsByIdPrefix:(NSString *)objectIdPrefix fromTable:(NSString *)tableName;

/**
 清除数据库中 表名为 tableName 的表
 
 @param tableName 表名
 */
- (void)dropTable:(NSString *)tableName;

#pragma mark - 接口：关闭数据库 队列

- (void)close;
@end




