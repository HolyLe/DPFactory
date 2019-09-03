//
//  UIImageView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit


extension XPChain where Base : UIImageView{
   
    @discardableResult
    func image(_ image : UIImage?) -> XPChain {
        object.image = image
        return self
    }
    
    @discardableResult
    func highlightedImage(_ highlightedImage : UIImage?) -> XPChain {
        object.highlightedImage = highlightedImage
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled : Bool) -> XPChain {
        object.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isHighlighted : Bool) -> XPChain {
        object.isHighlighted = isHighlighted
        return self
    }
    
    @discardableResult
    func animationImages(_ animationImages : [UIImage]?) -> XPChain {
        object.animationImages = animationImages
        return self
    }
    
    @discardableResult
    func highlightedAnimationImages(_ highlightedAnimationImages : [UIImage]?) -> XPChain {
        object.highlightedAnimationImages = highlightedAnimationImages
        return self
    }
    
    @discardableResult
    func animationDuration(_ animationDuration : TimeInterval) -> XPChain {
        object.animationDuration = animationDuration
        return self
    }
    
    @discardableResult
    func animationRepeatCount(_ animationRepeatCount : Int) -> XPChain {
        object.animationRepeatCount = animationRepeatCount
        return self
    }

    
    @discardableResult
    func startAnimating() -> XPChain {
        object.startAnimating()
        return self
    }
    
    @discardableResult
    func stopAnimating() -> XPChain {
        object.stopAnimating()
        return self
    }
    
    
}
