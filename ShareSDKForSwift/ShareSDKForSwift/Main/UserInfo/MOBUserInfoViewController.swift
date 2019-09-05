//
//  MOBUserInfoViewController.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

class MOBUserInfoTableViewCell: MOBHeadPicterTableViewCell {
    
    lazy var userInfoButton : UIImageView = {
        UIImageView.init()
    }()
    
    func updateModel(_ model: MOBPlatformModel) {
         super.updateModel(model)
    }
    
}
class MOBUserInfoViewController: UIViewController, MOBTableViewProtocol {
    
    var tableView: UITableView?
    var dataSource : [MOBPlatformModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.make_chain.register(MOBUserInfoTableViewCell.self, forCellReuseIdentifier: "MOBUserInfoTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "MOBUserInfoTableViewCell", for: indexPath).model(dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
