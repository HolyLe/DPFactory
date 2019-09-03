//
//  UIButton+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIButton {
    
    @discardableResult
    func contentEdgeInsets(_ contentEdgeInsets : UIEdgeInsets) -> XPChain {
        object.contentEdgeInsets = contentEdgeInsets
        return self
    }
    
    @discardableResult
    func titleEdgeInsets(_ titleEdgeInsets : UIEdgeInsets) -> XPChain {
        object.titleEdgeInsets = titleEdgeInsets
        return self
    }
    
    @discardableResult
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted : Bool) -> XPChain {
        object.reversesTitleShadowWhenHighlighted = reversesTitleShadowWhenHighlighted
        return self
    }
    
    @discardableResult
    func imageEdgeInsets(_ imageEdgeInsets : UIEdgeInsets) -> XPChain {
        object.imageEdgeInsets = imageEdgeInsets
        return self
    }
    
    @discardableResult
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted : Bool) -> XPChain {
        object.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        return self
    }
    
    @discardableResult
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled : Bool) -> XPChain {
        object.adjustsImageWhenDisabled = adjustsImageWhenDisabled
        return self
    }
    
    @discardableResult
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted : Bool) -> XPChain {
        object.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }
    
    @discardableResult
    func setTitle(_ title: String?, for state: UIControl.State) -> XPChain {
        object.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func setTitleColor(_ color: UIColor?, for state: UIControl.State) -> XPChain {
        object.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func setTitleShadowColor(_ color: UIColor?, for state: UIControl.State) -> XPChain {
        object.setTitleShadowColor(color, for: state)
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage?, for state: UIControl.State) -> XPChain {
        object.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setBackgroundImage(_ image: UIImage?, for state: UIControl.State) -> XPChain {
        object.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State)-> XPChain {
        object.setAttributedTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func isSelected(_ selected: Bool)-> XPChain {
        object.isSelected = selected
        return self
    }
    
    @discardableResult
    func isEnabled(_ enabled: Bool)-> XPChain {
        object.isEnabled = enabled
        return self
    }
}
