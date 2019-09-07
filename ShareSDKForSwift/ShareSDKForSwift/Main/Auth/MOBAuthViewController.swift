//
//  MOBAuthViewController.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

class MOBAuthTableViewCell: MOBHeadPicterTableViewCell {
    
    lazy var authButton : UIImageView = {
        UIImageView.init()
    }()
    
    override func updateModel(_ model: AnyObject) {
        super.updateModel(model)
    }
    
}

class MOBAuthViewController: UIViewController, MOBTableViewProtocol {
    
    var tableView: UITableView?
    var dataSource : [MOBPlatformModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.make_chain.register(MOBAuthTableViewCell.self, forCellReuseIdentifier: "MOBAuthTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "MOBAuthTableViewCell", for: indexPath).model(dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
