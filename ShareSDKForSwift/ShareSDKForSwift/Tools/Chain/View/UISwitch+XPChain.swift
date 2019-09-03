//
//  UISwitch+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UISwitch {
    
    @discardableResult
    func onTintColor(_ onTintColor : UIColor?) -> XPChain {
        object.onTintColor = onTintColor
        return self
    }
    
    @discardableResult
    func tintColor(_ tintColor : UIColor!) -> XPChain {
        object.tintColor = tintColor
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ thumbTintColor : UIColor?) -> XPChain {
        object.thumbTintColor = thumbTintColor
        return self
    }
    
    @discardableResult
    func onImage(_ onImage : UIImage?) -> XPChain {
        object.onImage = onImage
        return self
    }
    
    @discardableResult
    func offImage(_ offImage : UIImage?) -> XPChain {
        object.offImage = offImage
        return self
    }
    
    @discardableResult
    func isOn(_ isOn : Bool) -> XPChain {
        object.isOn = isOn
        return self
    }
    
    @discardableResult
    func setOn(_ on: Bool, animated: Bool) -> XPChain {
        object.setOn(on, animated: animated)
        return self
    }
    
}
