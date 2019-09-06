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


typealias MOBPlatformShareItemModelBlock = ((_ view : UIView?, _ item : MOBPlatformShareItemModel, _ response :((_ respose : [String : String]?)->Void))->Void)?
class MOBPlatformShareItemModel : MOBPlatformBaseModel {
    
    
    /// 懒加载
    lazy var parameter : [String : String] = {
        [String:String]()
    }()
    
   
    
    fileprivate var shareClick : MOBPlatformShareItemModelBlock = nil
    
    fileprivate var configure : (()->Void)?
    
    var name : String?
    var image : String?
    
    typealias ShareItemBlockType = ( _ itemPara : [String : String])->Void
    
    @discardableResult
    func itemParameter(_ para : ShareItemBlockType )-> Self {
        para(parameter)
        return self
    }
    @discardableResult
    func itemName(_ itemName : String?) -> Self {
        name = itemName
        return self
    }
    @discardableResult
    func itemImage(_ itemImage : String?) -> Self {
        image = itemImage
        return self
    }
    /// 初始化可以选择设置一个View或不设,分享时可以设置View，
    /// 不设置默认使用shareView，若shareView为空则啥都不返回
    
    @discardableResult
    func shareConfigure(_ callBack : MOBPlatformShareItemModelBlock) -> Self{
        if let con = configure {
            con()
        }
        shareClick = callBack
        return self
    }
    
    func share(_ view : UIView?, _ response : ((_ response : [String : String]?)->Void)){
        if let click = shareClick {
            if let superView = view {
                click(superView, self, response)
            }
        }
    }
}

class MOBPlatformShareModel : MOBPlatformBaseModel {
    private var _shareItem : [MOBPlatformShareItemModel] = []
    var shareItems : [MOBPlatformShareItemModel]?{
        return _shareItem
    }
    
    private var lastConfigureIndex = 0
    
    @discardableResult
    func addShareItem(_ configureItem : ((_ item: MOBPlatformShareItemModel) -> Void)) -> Self{
        let item = MOBPlatformShareItemModel.init(platformInfo!)
        
        let count = _shareItem.count
        item.configure = {
            self.lastConfigureIndex = count
        }
        configureItem(item)
        _shareItem.append(item)
        return self
    }
    
    @discardableResult
    func shareConfigure(_ callBack : MOBPlatformShareItemModelBlock) -> Self{
        let currentIndex = lastConfigureIndex
        let count = _shareItem.count
        for index in currentIndex..<count {
            _shareItem[index].shareClick = callBack
        }
        lastConfigureIndex = count
        return self
    }
    
    
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
    var isNeedAuth : Bool {
        get {
            return authStatus == .fail || authStatus == .unstart
        }
    }
    var isNeedUserInfo : Bool {
        get {
            return authStatus == .finish && _userInfo == nil
        }
    }
    
    /// 请求状态
    var authStatus = MOBPlatformAuthStatus.unstart
    
    typealias ObserveBlock = (_ userInfo : [String : String]?)->Void
    
    var observeObjs : [String:ObserveBlock] = [:]
    
    
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
            self.notifyToObserves(newData)
        }
    }
    
    /// 初始化方法
    override init(_ superInfo: MOBPlatformModel) {
        super.init(superInfo)
        userInfo = MOBCache.get(forKey: superInfo.platformName) as? [String : String]
        authStatus = MOBCache.get(forKey: superInfo.platformName + "Auth") as! MOBPlatformAuthStatus
    }
    typealias AuthRespone = (_ response : [String : String]?)->Void
    //检测当前授权状态
    func auth() {
        switch authStatus {
        case .unstart,.fail: do{
            authStatus = .starting
            authPlatform { (dic) in
                self.authStatus = .finish
                self.userInfo = dic
            }
            break
            }
        case .finish:do {
            unauthPlatform { (dic) in
                self.authStatus = .unstart
                self.userInfo = dic
            }
            break
            }
        case .starting:break
        }
    }
    
    func notifyToObserves(_ dic : [String : String]?)  {
        for (_,block) in self.observeObjs {
            block(dic)
        }
    }
    
    func authPlatform(_ response : @escaping(AuthRespone)) {
        DispatchQueue.global().asyncAfter(deadline:DispatchTime.now() + 1 ) {
            let dic = ["key":"value"]
            MOBCache.setObject(MOBPlatformAuthStatus.finish, self.platformInfo!.platformName  + "Auth")
            MOBCache.setObject(dic, self.platformInfo!.platformName)
            response(dic)
        }
    }
    
    func unauthPlatform(_ response : @escaping(AuthRespone)) {
        DispatchQueue.global().asyncAfter(deadline:DispatchTime.now() + 1 ) {
            MOBCache.setObject(nil, self.platformInfo!.platformName  + "Auth")
            MOBCache.setObject(nil, self.platformInfo!.platformName)
            response(nil)
        }
    }
    
    func getUserInfo(_ response : @escaping(AuthRespone)) {
        if isNeedAuth {
            auth()
            return
        }
        if isNeedUserInfo {
            DispatchQueue.global().asyncAfter(deadline:DispatchTime.now() + 1 ) {
                let dic = ["key":"value"]
                self.userInfo = dic
            }
        }else{
            response(userInfo!)
        }
    }
    
    func registerObserveAuthStatus(_ key : String, _ observe : @escaping ObserveBlock) {
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
    
    lazy var share : MOBPlatformShareModel = {
      return MOBPlatformShareModel.init(self)
    }()
    
    lazy var userInfo : MOBPlatformAuthModel = {
        MOBPlatformAuthModel.init(self)
    }()
    
    init(forPlatform platformType : Int) {
        super.init()
        self.platformType = platformType
        self.platformName = "ShareType_\(platformType)"
        self.platformImage = "Icon_simple/sns_icon_\(platformType).png"
    }
    
    func configureShareInfo(_ shareConfigure: (_ shareConfigure : MOBPlatformShareModel) -> Void) -> Self {
        shareConfigure(self.share)
        return self
    }
    
}
