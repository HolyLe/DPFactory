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
class MOBUserInfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
