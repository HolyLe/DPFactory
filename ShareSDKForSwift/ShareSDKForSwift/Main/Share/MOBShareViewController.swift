//
//  MObShareViewController.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

class MOBShareTableViewCell : MOBHeadPicterTableViewCell {
    lazy var shareImage : UIImageView = {
        UIImageView.init()
    }()
    
    override func updateModel(_ model: AnyObject) {
         super.updateModel(model)
            
    }
    
}
class MOBShareViewController: UIViewController, MOBTableViewProtocol {
    var tableView: UITableView?
    var dataSource : AnyObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.make_chain.register(MOBShareTableViewCell.self, forCellReuseIdentifier: "MOBShareTableViewCell")
        guard dataSource != nil else {
            dataSource = MOBPlatformDataSource as AnyObject
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "MOBShareTableViewCell", for: indexPath).model(dataSource![indexPath.row] as AnyObject)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource![indexPath.row] as AnyObject
        if model is MOBPlatformModel {
            let m = model as! MOBPlatformModel
            let vc = MOBShareViewController.init()
            vc.dataSource = m.share.shareItems as AnyObject
            vc.title = m.platformName
            let nav = self.view.window?.rootViewController as! UINavigationController
            nav.pushViewController(vc, animated: true)
        }else if (model is MOBPlatformShareItemModel){
            let m = model as! MOBPlatformShareItemModel
            m.share(view) {[weak m] (dic) in
//                print(m?.platformInfo!.platformName)
            }
        }
    }
}

