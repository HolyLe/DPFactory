//
//  Util.swift
//  ShareSDKForSwift
//
//  Created by 麻小亮 on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import Foundation

func getClassFromString(_ classString : String?) -> AnyClass? {
    if classString != nil{
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{ print("没有获取到命名空间")
            return nil
        }
        //2.根据字符串获取对应的Class
        guard let childVCClass = NSClassFromString(nameSpace + "." + classString!) else {
            return nil
        }
       return childVCClass
    }
    return nil
}
