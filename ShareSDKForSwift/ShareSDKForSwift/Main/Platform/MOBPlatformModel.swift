//
//  MOBPlatformModel.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit


struct MOBPlatformAuthModel {
    var authTap : ((_ response : Dictionary <String,String>) -> Void)?
}

struct MOBPlatformShareParameterModel {
    
}

struct MOBPlatformShareItemModel {
    let name  : String
    let image : String
    let parameter : MOBPlatformShareParameterModel
    var shareTap : ((_ response : Dictionary <String,String>) -> Void)?
}

struct MOBPlatformShareModel {
    var shareItems : [MOBPlatformShareItemModel]?
}

struct MOBPlatformUserInfoModel {
    var name : String
    init(_ name : String ) {
        self.name = name
        _userInfo = UserDefaults.standard.object(forKey: name) as? Dictionary<String, String>
    }
    private var _userInfo : Dictionary <String, String>?
    var userInfo : Dictionary <String, String>?{
        get {
            return _userInfo
        }
        set (newData){
            _userInfo = newData
            if newData == nil {
               UserDefaults.standard.setNilValueForKey(name)
            }else{
               UserDefaults.standard.setValue(newData, forKey: name)
            }
        }
    }
}

struct MOBPlatformModel {
    let platFormType : Int
    let name  : String
    let image : String
    var isAuth : Bool {
        mutating get {
            return userInfo.userInfo == nil
        }
    }
    
    lazy var author : MOBPlatformAuthModel = {
        MOBPlatformAuthModel.init()
    }()
    
    let share : MOBPlatformShareModel = {
        MOBPlatformShareModel.init()
    }()
    
    lazy var userInfo : MOBPlatformUserInfoModel = {
        MOBPlatformUserInfoModel.init(name)
    }()
    
    init(_ platFormType : Int, _ name : String, _ image : String) {
        self.platFormType = platFormType
        self.name = name
        self.image = image
    }
    
    func configureShareInfo(_ shareConfigure: (_ shareConfigure : MOBPlatformShareModel) -> Void) -> Self {
        shareConfigure(self.share)
        return self
    }
    
}
