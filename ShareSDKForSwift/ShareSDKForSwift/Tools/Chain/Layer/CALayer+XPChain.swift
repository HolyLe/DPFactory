//
//  CALayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CALayer {
    
    
    @discardableResult
    func bounds(_ bounds : CGRect) -> XPChain {
        object.bounds = bounds
        return self
    }
    
    @discardableResult
    func position(_ position : CGPoint) -> XPChain {
        object.position = position
        return self
    }
    
    @discardableResult
    func zPosition(_ zPosition : CGFloat) -> XPChain {
        object.zPosition = zPosition
        return self
    }
    
    @discardableResult
    func anchorPoint(_ anchorPoint : CGPoint) -> XPChain {
        object.anchorPoint = anchorPoint
        return self
    }
    
    @discardableResult
    func anchorPointZ(_ anchorPointZ : CGFloat) -> XPChain {
        object.anchorPointZ = anchorPointZ
        return self
    }
    
    @discardableResult
    func transform(_ transform : CATransform3D) -> XPChain {
        object.transform = transform
        return self
    }
    
    @discardableResult
    func frame(_ frame : CGRect) -> XPChain {
        object.frame = frame
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden : Bool) -> XPChain {
        object.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func isDoubleSided(_ isDoubleSided : Bool) -> XPChain {
        object.isDoubleSided = isDoubleSided
        return self
    }
    
    @discardableResult
    func isGeometryFlipped(_ isGeometryFlipped : Bool) -> XPChain {
        object.isGeometryFlipped = isGeometryFlipped
        return self
    }
    
    @discardableResult
    func sublayers(_ sublayers : [CALayer]?) -> XPChain {
        object.sublayers = sublayers
        return self
    }
    
    @discardableResult
    func addSublayer(_ sublayer : CALayer) -> XPChain {
        object.addSublayer(sublayer)
        return self
    }
    
    
    
    @discardableResult
    func addToSuperLayer(_ superLayer : CALayer) -> XPChain {
        superLayer.addSublayer(object)
        return self
    }
    
    @discardableResult
    func insertSublayer(_ layer: CALayer, at idx: UInt32) -> XPChain {
        object.insertSublayer(layer, at: idx)
        return self
    }
    
    @discardableResult
    func insertSublayer(_ layer: CALayer, below sibling: CALayer?) -> XPChain {
        object.insertSublayer(layer, below: sibling)
        return self
    }
    
    @discardableResult
    func insertSublayer(_ layer: CALayer, above sibling: CALayer?) -> XPChain {
        object.insertSublayer(layer, above: sibling)
        return self
    }
    
    @discardableResult
    func replaceSublayer(_ oldLayer: CALayer, with newLayer: CALayer) -> XPChain {
        object.replaceSublayer(oldLayer, with: newLayer)
        return self
    }
    
    @discardableResult
    func sublayerTransform(_ sublayerTransform : CATransform3D) -> XPChain {
        object.sublayerTransform = sublayerTransform
        return self
    }
    
    @discardableResult
    func mask(_ mask : CALayer?) -> XPChain {
        object.mask = mask
        return self
    }
    
    @discardableResult
    func masksToBounds(_ masksToBounds : Bool) -> XPChain {
        object.masksToBounds = masksToBounds
        return self
    }
    
    @discardableResult
    func contents(_ contents : Any?) -> XPChain {
        object.contents = contents
        return self
    }
    
    @discardableResult
    func contentsRect(_ contentsRect : CGRect) -> XPChain {
        object.contentsRect = contentsRect
        return self
    }
    
    @discardableResult
    func contentsScale(_ contentsScale : CGFloat) -> XPChain {
        object.contentsScale = contentsScale
        return self
    }
    
    @discardableResult
    func contentsGravity(_ contentsGravity : CALayerContentsGravity) -> XPChain {
        object.contentsGravity = contentsGravity
        return self
    }
    
    @discardableResult
    func contentsCenter(_ contentsCenter : CGRect) -> XPChain {
        object.contentsCenter = contentsCenter
        return self
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func contentsFormat(_ contentsFormat : CALayerContentsFormat) -> XPChain {
        object.contentsFormat = contentsFormat
        return self
    }
    
    @discardableResult
    func minificationFilter(_ minificationFilter : CALayerContentsFilter) -> XPChain {
        object.minificationFilter = minificationFilter
        return self
    }
    
    @discardableResult
    func magnificationFilter(_ magnificationFilter : CALayerContentsFilter) -> XPChain {
        object.magnificationFilter = magnificationFilter
        return self
    }
    
    @discardableResult
    func minificationFilterBias(_ minificationFilterBias : Float) -> XPChain {
        object.minificationFilterBias = minificationFilterBias
        return self
    }
    @discardableResult
    func isOpaque(_ isOpaque : Bool) -> XPChain {
        object.isOpaque = isOpaque
        return self
    }
    
    @discardableResult
    func needsDisplayOnBoundsChange(_ needsDisplayOnBoundsChange : Bool) -> XPChain {
        object.needsDisplayOnBoundsChange = needsDisplayOnBoundsChange
        return self
    }
    
    @discardableResult
    func drawsAsynchronously(_ drawsAsynchronously : Bool) -> XPChain {
        object.drawsAsynchronously = drawsAsynchronously
        return self
    }
    
    @discardableResult
    func edgeAntialiasingMask(_ edgeAntialiasingMask : CAEdgeAntialiasingMask) -> XPChain {
        object.edgeAntialiasingMask = edgeAntialiasingMask
        return self
    }
    
    @discardableResult
    func allowsEdgeAntialiasing(_ allowsEdgeAntialiasing : Bool) -> XPChain {
        object.allowsEdgeAntialiasing = allowsEdgeAntialiasing
        return self
    }
    
    @discardableResult
    func backgroundColor(_ backgroundColor : CGColor?) -> XPChain {
        object.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func cornerRadius(_ cornerRadius : CGFloat) -> XPChain {
        object.cornerRadius = cornerRadius
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func maskedCorners(_ maskedCorners : CACornerMask) -> XPChain {
        object.maskedCorners = maskedCorners
        return self
    }
    @discardableResult
    func borderWidth(_ borderWidth : CGFloat) -> XPChain {
        object.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    func borderColor(_ borderColor : CGColor?) -> XPChain {
        object.borderColor = borderColor
        return self
    }
    
    @discardableResult
    func opacity(_ opacity : Float) -> XPChain {
        object.opacity = opacity
        return self
    }
    
    @discardableResult
    func allowsGroupOpacity(_ allowsGroupOpacity : Bool) -> XPChain {
        object.allowsGroupOpacity = allowsGroupOpacity
        return self
    }
    
    @discardableResult
    func compositingFilter(_ compositingFilter : Any?) -> XPChain {
        object.compositingFilter = compositingFilter
        return self
    }
    
    @discardableResult
    func filters(_ filters : [Any]?) -> XPChain {
        object.filters = filters
        return self
    }
    
    @discardableResult
    func backgroundFilters(_ backgroundFilters : [Any]?) -> XPChain {
        object.backgroundFilters = backgroundFilters
        return self
    }
    
    @discardableResult
    func shouldRasterize(_ shouldRasterize : Bool) -> XPChain {
        object.shouldRasterize = shouldRasterize
        return self
    }
    @discardableResult
    func rasterizationScale(_ rasterizationScale : CGFloat) -> XPChain {
        object.rasterizationScale = rasterizationScale
        return self
    }
    
    @discardableResult
    func shadowColor(_ shadowColor : CGColor?) -> XPChain {
        object.shadowColor = shadowColor
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ shadowOpacity : Float) -> XPChain {
        object.shadowOpacity = shadowOpacity
        return self
    }
    
    @discardableResult
    func shadowOffset(_ shadowOffset : CGSize) -> XPChain {
        object.shadowOffset = shadowOffset
        return self
    }
    
    @discardableResult
    func shadowRadius(_ shadowRadius : CGFloat) -> XPChain {
        object.shadowRadius = shadowRadius
        return self
    }
    
    @discardableResult
    func shadowPath(_ shadowPath : CGPath?) -> XPChain {
        object.shadowPath = shadowPath
        return self
    }
    
    @discardableResult
    func add(_ anim: CAAnimation, forKey key: String?) -> XPChain {
        object.add(anim, forKey: key)
        return self
    }
    
    @discardableResult
    func removeAllAnimations() -> XPChain {
        object.removeAllAnimations()
        return self
    }
    @discardableResult
    func removeAnimation(forKey key: String) -> XPChain {
        object.removeAnimation(forKey: key)
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : CALayerDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func style(_ style : [AnyHashable : Any]?) -> XPChain {
        object.style = style
        return self
    }
}
