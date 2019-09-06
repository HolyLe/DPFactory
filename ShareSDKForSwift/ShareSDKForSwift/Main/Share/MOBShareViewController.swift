//
//  MObShareViewController.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

class MOBShareTableViewCell: MOBHeadPicterTableViewCell {
    lazy var shareImage : UIImageView = {
        UIImageView.init()
    }()
    
    override func updateModel(_ model: MOBPlatformModel) {
         super.updateModel(model)
            
    }
    
}
class MOBShareViewController: UIViewController, MOBTableViewProtocol {
    var tableView: UITableView?
    var dataSource : [MOBPlatformModel] = MOBPlatformDataSource
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.make_chain.register(MOBShareTableViewCell.self, forCellReuseIdentifier: "MOBShareTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "MOBShareTableViewCell", for: indexPath).model(dataSource[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
