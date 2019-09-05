//
//  MOBPlatformModel.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

class MOBPlatformBaseModel: NSObject {
    weak var platformInfo : MOBPlatformModel?
    init(_ superInfo : MOBPlatformModel) {
        self.platformInfo = superInfo
    }
}

class MOBPlatformShareParameterModel {
    
}

class MOBPlatformShareItemModel : MOBPlatformBaseModel {
    
    var parameter : MOBPlatformShareParameterModel?
    
    func share(_ view : UIView, _ callBack : (_ respose : [String : String])->Void) {
        
    }
}

class MOBPlatformShareModel : MOBPlatformBaseModel {
    var shareItems : [MOBPlatformShareItemModel]?
}

enum MOBPlatformAuthStatus : String {
    case unstart = "-1",starting,finish,fail
}

//认证相关
class MOBPlatformAuthModel : MOBPlatformBaseModel {
    
    /// 是否认证
    var isFinsh : Bool {
        get {
            return authStatus == .finish
        }
    }
    var isFail : Bool {
        get {
            return authStatus == .fail
        }
    }
    var isRequestUserInfo : Bool {
        get {
            return authStatus == .finish && _userInfo == nil
        }
    }
    
    /// 请求状态
    var authStatus = MOBPlatformAuthStatus.unstart
    
    typealias observeBlock = (_ userInfo : [String : String]?)->Void
    
    var observeObjs : [String:observeBlock] = [:]
    
    
    /// 状态更新，用户数据
    private var _userInfo : [String : String]?
    var userInfo : [String : String]?{
        get {
            return _userInfo
        }
        set (newData){
            _userInfo = newData
            MOBCache.setObject(newData, platformInfo!.platformName)
            if let value = MOBCache.get(forKey: platformInfo!.platformName) as? MOBPlatformAuthStatus {
                authStatus = value
            }else{
                authStatus =  .unstart
            }
        }
    }
    
    /// 初始化方法
    override init(_ superInfo: MOBPlatformModel) {
        super.init(superInfo)
        userInfo = MOBCache.get(forKey: superInfo.platformName) as? [String : String]
        authStatus = MOBCache.get(forKey: superInfo.platformName + "Auth") as! MOBPlatformAuthStatus
    }
    //检测当前授权状态
    func auth() {
        switch authStatus {
        case .unstart,.fail: do{
            authStatus = .starting
            authPlatform { (dic) in
                self.authStatus = .finish
                self.notifyToObserves(dic)
            }
            break
            }
        case .finish:do {
            unauthPlatform { (dic) in
                self.authStatus = .unstart
                self.notifyToObserves(dic)
            }
            break
            }
        case .starting:break
        }
    }
    
    func notifyToObserves(_ dic : [String : String]?)  {
        self.userInfo = dic
        for (_,block) in self.observeObjs {
            block(self.userInfo)
        }
    }
    
    func authPlatform(_ response : @escaping((_ response : [String : String]?)->Void)) {
        DispatchQueue.global().asyncAfter(deadline:DispatchTime.now() + 1 ) {
            let dic = ["key":"value"]
            MOBCache.setObject(MOBPlatformAuthStatus.finish, self.platformInfo!.platformName  + "Auth")
            MOBCache.setObject(dic, self.platformInfo!.platformName)
            response(dic)
        }
    }
    
    func unauthPlatform(_ response : @escaping((_ response : [String : String]?)->Void)) {
        DispatchQueue.global().asyncAfter(deadline:DispatchTime.now() + 1 ) {
            MOBCache.setObject(nil, self.platformInfo!.platformName  + "Auth")
            MOBCache.setObject(nil, self.platformInfo!.platformName)
            response(nil)
        }
    }
    
    func getUserInfo(_ response : @escaping((_ response : [String : String]?)->Void)) {
        if let info = _userInfo{
            response(info)
            return
        }else{
            DispatchQueue.global().asyncAfter(deadline:DispatchTime.now() + 1 ) {
                let dic = ["key":"value"]
                MOBCache.setObject(MOBPlatformAuthStatus.finish, self.platformInfo!.platformName  + "Auth")
                MOBCache.setObject(dic, self.platformInfo!.platformName)
                response(dic)
            }
        }
    }
    
    func registerObserveAuthStatus(_ key : String, _ observe : @escaping observeBlock) {
        observeObjs[key] = observe
    }
    
    func unregisterObserveAuthStatus(_ key : String) {
        observeObjs[key] = nil
    }
    
    
}

class MOBPlatformModel : NSObject {
    
    var platformType = -1
    
    var platformName  : String = ""
    var platformImage : String?
    
    //    let share : MOBPlatformShareModel = {
    ////        MOBPlatformShareModel.init(self)
    //    }()
    
    lazy var userInfo : MOBPlatformAuthModel = {
        MOBPlatformAuthModel.init(self)
    }()
    
    init(_ platformType : Int,  _ platformName : String, _ platformImage : String?) {
        self.platformType = platformType
        self.platformName = platformName
        self.platformImage = platformImage
    }
    
    func configureShareInfo(_ shareConfigure: (_ shareConfigure : MOBPlatformShareModel) -> Void) -> Self {
        //        shareConfigure(self.share)
        return self
    }
    
}
