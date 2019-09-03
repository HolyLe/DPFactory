//
//  UIView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/20.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

public extension XPChain where Base : UIView  {
    
    @discardableResult
    func tag(_ tag: Int) -> XPChain {
        object.tag = tag
        return self
    }
    
    /*
     frame
     */
    
    @discardableResult
    func frame(_ frame: CGRect) -> XPChain {
        object.frame = frame
        return self
    }
    
    @discardableResult
    func frame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> XPChain {
        object.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    
    @discardableResult
    func bounds(_ bounds: CGRect) -> XPChain {
        object.bounds = bounds
        return self
    }
    
    @discardableResult
    func center(_ center: CGPoint) -> XPChain {
        object.center = center
        return self
    }
    
    @discardableResult
    func center(x: CGFloat, y: CGFloat) -> XPChain {
        object.center = CGPoint(x: x, y: y)
        return self
    }
    
    /*
     show
     */
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> XPChain {
        object.backgroundColor = backgroundColor
        return self
    }
    
    
    @discardableResult
    func contentMode(_ contentMode: UIView.ContentMode) -> XPChain {
        object.contentMode = contentMode
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> XPChain {
        object.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> XPChain {
        object.alpha = alpha
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> XPChain {
        object.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> XPChain {
        object.isOpaque = isOpaque
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> XPChain {
        object.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> XPChain {
        object.tintColor = tintColor
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> XPChain {
        object.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    func masksToBounds(_ masksToBounds: Bool) -> XPChain {
        object.layer.masksToBounds = masksToBounds
        return self
    }
    
    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> XPChain {
        object.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    func borderColor(_ borderColor: UIColor) -> XPChain {
        object.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> XPChain {
        object.layer.shadowColor = shadowColor?.cgColor
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> XPChain {
        object.layer.shadowOpacity = shadowOpacity
        return self
    }
    
    @discardableResult
    func layerBackgroundColor(_ color : CGColor) -> XPChain {
        object.layer.backgroundColor = color
        return self
    }
    
    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> XPChain {
        object.layer.shadowOffset = shadowOffset
        return self
    }
    
    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> XPChain {
        object.layer.shadowRadius = shadowRadius
        return self
    }
    
    @discardableResult
    func shadowPath(_ shadowPath: CGPath?) -> XPChain {
        object.layer.shadowPath = shadowPath
        return self
    }
    
    @discardableResult
    func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) -> XPChain {
        object.addGestureRecognizer(gestureRecognizer)
        return self
    }
    
    @discardableResult
    func addConstraint(_ constraint: NSLayoutConstraint) -> XPChain {
        object.addConstraint(constraint)
        return self
    }
    
    @discardableResult
    func addConstraints(_ constraints: [NSLayoutConstraint]) -> XPChain {
        object.addConstraints(constraints)
        return self
    }
    
    @discardableResult
    func mask(_ mask : UIView) -> XPChain {
        object.mask = mask
        return self
    }
    
    @discardableResult
    func tintAdjustmentMode(_ tintAdjustmentMode : UIView.TintAdjustmentMode) -> XPChain {
        object.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    @discardableResult
    func addMotionEffect(_ effect: UIMotionEffect) -> XPChain {
        object.addMotionEffect(effect)
        return self
    }
    
    @discardableResult
    func removeMotionEffect(_ effect: UIMotionEffect) -> XPChain {
        object.removeMotionEffect(effect)
        return self
    }
    @discardableResult
    func motionEffects(_ effects : [UIMotionEffect]) -> XPChain {
        object.motionEffects = effects
        return self
    }
    
    @discardableResult
    func addSubview(_ view: UIView) -> XPChain {
        object.addSubview(view)
        return self
    }
    
    @discardableResult
    func addToSuperView (_ superView : UIView) -> XPChain {
        superView.addSubview(object)
        return self;
    }
    
    @discardableResult
    func setContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> XPChain {
        object.setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func setContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> XPChain{
        object.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func removeGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) -> XPChain{
        object.removeGestureRecognizer(gestureRecognizer)
        return self
    }
}
