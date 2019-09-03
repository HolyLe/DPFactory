//
//  UIControl+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/20.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIControl {
    
    @discardableResult
    func contentVerticalAlignment(_ contentVerticalAlignment : UIControl.ContentVerticalAlignment) -> XPChain {
        object.contentVerticalAlignment = contentVerticalAlignment
        return self
    }
    
    @discardableResult
    func contentHorizontalAlignment(_ contentHorizontalAlignment : UIControl.ContentHorizontalAlignment) -> XPChain {
        object.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
    
    @discardableResult
    func addTarget(_ target : Any?,_ action :Selector, for controlEvents : UIControl.Event) -> XPChain {
        object.addTarget(target, action: action, for: controlEvents)
        return self
    }
    
    @discardableResult
    func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event) -> XPChain {
        object.removeTarget(target, action: action, for: controlEvents)
        return self
    }
    
    @discardableResult
    func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) -> XPChain {
        object.sendAction(action, to: target, for: event)
        return self
    }
    
    @discardableResult
    func sendActions(for controlEvents: UIControl.Event) -> XPChain {
        object.sendActions(for: controlEvents)
        return self
    }
}


