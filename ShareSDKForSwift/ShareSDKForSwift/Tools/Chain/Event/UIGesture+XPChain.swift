//
//  UIGesture+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIGestureRecognizer {
    
    @discardableResult
    func addTarget(_ target: Any, action: Selector) -> XPChain {
        object.addTarget(target, action: action)
        return self
    }
    
    @discardableResult
    func removeTarget(_ target: Any?, action: Selector?) -> XPChain {
        object.removeTarget(target, action: action)
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : UIGestureRecognizerDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func isEnabled(_ isEnabled : Bool) -> XPChain {
        object.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func cancelsTouchesInView(_ cancelsTouchesInView : Bool) -> XPChain {
        object.cancelsTouchesInView = cancelsTouchesInView
        return self
    }
    
    @discardableResult
    func delaysTouchesBegan(_ delaysTouchesBegan : Bool) -> XPChain {
        object.delaysTouchesBegan = delaysTouchesBegan
        return self
    }
    
    @discardableResult
    func delaysTouchesEnded(_ delaysTouchesEnded : Bool) -> XPChain {
        object.delaysTouchesEnded = delaysTouchesEnded
        return self
    }
    @available(iOS 9.0, *)
    @discardableResult
    func allowedTouchTypes(_ allowedTouchTypes : [NSNumber]) -> XPChain {
        object.allowedTouchTypes = allowedTouchTypes
        return self
    }
    @available(iOS 9.0, *)
    @discardableResult
    func allowedPressTypes(_ allowedPressTypes : [NSNumber]) -> XPChain {
        object.allowedPressTypes = allowedPressTypes
        return self
    }
    @available(iOS 9.2, *)
    @discardableResult
    func requiresExclusiveTouchType(_ requiresExclusiveTouchType : Bool) -> XPChain {
        object.requiresExclusiveTouchType = requiresExclusiveTouchType
        return self
    }
    
    @discardableResult
    func require(toFail otherGestureRecognizer: UIGestureRecognizer) -> XPChain {
        object.require(toFail: otherGestureRecognizer)
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func name(_ name : String?) -> XPChain {
        object.name = name
        return self
    }
    
}
