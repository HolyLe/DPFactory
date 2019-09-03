//
//  UISlider+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UISlider {
    
    @discardableResult
    func value(_ value : Float) -> XPChain {
        object.value = value
        return self
    }
    
    @discardableResult
    func minimumValue(_ minimumValue : Float) -> XPChain {
        object.minimumValue = minimumValue
        return self
    }
    
    @discardableResult
    func maximumValue(_ maximumValue : Float) -> XPChain {
        object.maximumValue = maximumValue
        return self
    }
    
    @discardableResult
    func minimumValueImage(_ minimumValueImage : UIImage?) -> XPChain {
        object.minimumValueImage = minimumValueImage
        return self
    }
    
    @discardableResult
    func maximumValueImage(_ maximumValueImage : UIImage?) -> XPChain {
        object.maximumValueImage = maximumValueImage
        return self
    }
    
    @discardableResult
    func isContinuous(_ isContinuous : Bool) -> XPChain {
        object.isContinuous = isContinuous
        return self
    }
    
    @discardableResult
    func minimumTrackTintColor(_ minimumTrackTintColor : UIColor?) -> XPChain {
        object.minimumTrackTintColor = minimumTrackTintColor
        return self
    }
    
    @discardableResult
    func maximumTrackTintColor(_ maximumTrackTintColor : UIColor?) -> XPChain {
        object.maximumTrackTintColor = maximumTrackTintColor
        return self
    }
    
    @discardableResult
    func thumbTintColor(_ thumbTintColor : UIColor?) -> XPChain {
        object.thumbTintColor = thumbTintColor
        return self
    }
    
    @discardableResult
    func setValue(_ value: Float, animated: Bool) -> XPChain {
        object.setValue(value, animated: animated)
        return self
    }
    
    @discardableResult
    func setThumbImage(_ image: UIImage?, for state: UIControl.State) -> XPChain {
        object.setThumbImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setMinimumTrackImage(_ image: UIImage?, for state: UIControl.State) -> XPChain {
        object.setMinimumTrackImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setMaximumTrackImage(_ image: UIImage?, for state: UIControl.State) -> XPChain {
        object.setMaximumTrackImage(image, for: state)
        return self
    }
}
