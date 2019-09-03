//
//  UIScrollView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIScrollView {
    
    @discardableResult
    func contentOffset(_ contentOffset : CGPoint) -> XPChain {
        object.contentOffset = contentOffset
        return self
    }
    
    @discardableResult
    func contentSize(_ contentSize : CGSize) -> XPChain {
        object.contentSize = contentSize
        return self
    }
    
    @discardableResult
    func contentInset(_ contentInset : UIEdgeInsets) -> XPChain {
        object.contentInset = contentInset
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func adjustedContentIOS11(_ adjustedContentInset : UIScrollView.ContentInsetAdjustmentBehavior) -> XPChain {
        object.contentInsetAdjustmentBehavior = .never
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : UIScrollViewDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled : Bool) -> XPChain {
        object.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    @discardableResult
    func bounces(_ bounces : Bool) -> XPChain {
        object.bounces = bounces
        return self
    }
    
    @discardableResult
    func alwaysBounceVertical(_ alwaysBounceVertical : Bool) -> XPChain {
        object.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    @discardableResult
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal : Bool) -> XPChain {
        object.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    
    @discardableResult
    func isPagingEnabled(_ isPagingEnabled : Bool) -> XPChain {
        object.isPagingEnabled = isPagingEnabled
        return self
    }
    
    @discardableResult
    func isScrollEnabled(_ isScrollEnabled : Bool) -> XPChain {
        object.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator : Bool) -> XPChain {
        object.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    @discardableResult
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator : Bool) -> XPChain {
        object.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    @discardableResult
    func indicatorStyle(_ indicatorStyle : UIScrollView.IndicatorStyle) -> XPChain {
        object.indicatorStyle = indicatorStyle
        return self
    }
    
    @discardableResult
    func decelerationRate(_ decelerationRate :  UIScrollView.DecelerationRate) -> XPChain {
        object.decelerationRate = decelerationRate
        return self
    }
    
    @discardableResult
    func indexDisplayMode(_ indexDisplayMode : UIScrollView.IndexDisplayMode) -> XPChain {
        object.indexDisplayMode = indexDisplayMode
        return self
    }
    
    @discardableResult
    func setContentOffset(_ contentOffset: CGPoint, animated: Bool) -> XPChain {
        object.setContentOffset(contentOffset, animated: animated)
        return self
    }
    
    @discardableResult
    func scrollRectToVisible(_ rect: CGRect, animated: Bool) -> XPChain {
        object.scrollRectToVisible(rect, animated: animated)
        return self
    }
    
    @discardableResult
    func delaysContentTouches(_ delaysContentTouches : Bool) -> XPChain {
        object.delaysContentTouches = delaysContentTouches
        return self
    }
    
    @discardableResult
    func canCancelContentTouches(_ canCancelContentTouches : Bool) -> XPChain {
        object.canCancelContentTouches = canCancelContentTouches
        return self
    }
    
    @discardableResult
    func minimumZoomScale(_ minimumZoomScale : CGFloat) -> XPChain {
        object.minimumZoomScale = minimumZoomScale
        return self
    }
    
    @discardableResult
    func maximumZoomScale(_ maximumZoomScale : CGFloat) -> XPChain {
        object.maximumZoomScale = maximumZoomScale
        return self
    }
    
    @discardableResult
    func zoomScale(_ zoomScale : CGFloat) -> XPChain {
        object.zoomScale = zoomScale
        return self
    }
    
    @discardableResult
    func setZoomScale(_ scale: CGFloat, animated: Bool) -> XPChain {
        object.setZoomScale(scale, animated: animated)
        return self
    }
    
    @discardableResult
    func zoom(to rect: CGRect, animated: Bool) -> XPChain {
        object.zoom(to: rect, animated: animated)
        return self
    }
    
    @discardableResult
    func bouncesZoom(_ bouncesZoom : Bool) -> XPChain {
        object.bouncesZoom = bouncesZoom
        return self
    }
    
    @discardableResult
    func scrollsToTop(_ scrollsToTop : Bool) -> XPChain {
        object.scrollsToTop = scrollsToTop
        return self
    }
    
    @discardableResult
    func refreshControl(_ refreshControl : UIRefreshControl?) -> XPChain {
        if #available(iOS 10.0, *) {
            object.refreshControl = refreshControl
        }
        return self
    }
    
    @discardableResult
    func keyboardDismissMode(_ keyboardDismissMode : UIScrollView.KeyboardDismissMode) -> XPChain {
        object.keyboardDismissMode = keyboardDismissMode
        return self
    }
}
