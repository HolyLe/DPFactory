//
//  MOBCache.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/5.
//  Copyright © 2019 mob. All rights reserved.
//

import Foundation


class MOBCache {
    
   static func setObject(_ object : Any?, _ key : String) {
        if object == nil{
            UserDefaults.standard.setNilValueForKey(key)
        }else{
            UserDefaults.standard.setValue(object, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    static func get(forKey key : String) -> Any? {
        UserDefaults.standard.object(forKey: key)
    }
    
    
}
