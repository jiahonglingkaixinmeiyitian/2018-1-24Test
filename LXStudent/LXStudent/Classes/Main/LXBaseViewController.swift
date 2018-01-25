//
//  LXBaseViewController.swift
//  linkTrustEducationPlatform
//
//  Created by 尚 on 2017/10/31.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

class LXBaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
    /// 基tableview
    var baseTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeTabelView()
        self.loadData()
    }
    
    func loadData(){
        
    }
    
    func makeTabelView() {
        self.baseTableView = UITableView(frame: .zero, style: .grouped)
        self.view.addSubview(self.baseTableView!)
        self.baseTableView?.delegate = self
        self.baseTableView?.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
