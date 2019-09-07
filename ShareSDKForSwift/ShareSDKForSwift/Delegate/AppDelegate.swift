//
//  AppDelegate.swift
//  ShareSDKForSwift
//
//  Created by 麻小亮 on 2019/9/3.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let version = Float(UIDevice.current.systemVersion)
        
        if version! < 13.0 {
            window?.backgroundColor = .white
        }
        // Override point for customization after application launch.
        return true
    }


}

