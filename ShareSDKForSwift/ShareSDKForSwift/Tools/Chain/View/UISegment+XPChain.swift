//
//  UISegment+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UISegmentedControl {
    
    @discardableResult
    func isMomentary(_ isMomentary : Bool) -> XPChain {
        object.isMomentary = isMomentary
        return self
    }
    
    @discardableResult
    func apportionsSegmentWidthsByContent(_ apportionsSegmentWidthsByContent : Bool) -> XPChain {
        object.apportionsSegmentWidthsByContent = apportionsSegmentWidthsByContent
        return self
    }
    
    @discardableResult
    func insertSegment(withTitle title: String?, at segment: Int, animated: Bool) -> XPChain {
        object.insertSegment(withTitle: title, at: segment, animated: animated)
        return self
    }
    
    @discardableResult
    func insertSegment(with image: UIImage?, at segment: Int, animated: Bool) -> XPChain {
        object.insertSegment(with: image, at: segment, animated: animated)
        return self
    }
    
    @discardableResult
    func removeSegment(at segment: Int, animated: Bool) -> XPChain {
        object.removeSegment(at: segment, animated: animated)
        return self
    }
    
    @discardableResult
     func setTitle(_ title: String?, forSegmentAt segment: Int) -> XPChain {
        object.setTitle(title, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage?, forSegmentAt segment: Int) -> XPChain {
        object.setImage(image, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func setWidth(_ width: CGFloat, forSegmentAt segment: Int) -> XPChain {
        object.setWidth(width, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func setContentOffset(_ offset: CGSize, forSegmentAt segment: Int) -> XPChain {
        object.setContentOffset(offset, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func setEnabled(_ enabled: Bool, forSegmentAt segment: Int) -> XPChain {
        object.setEnabled(enabled, forSegmentAt: segment)
        return self
    }
    
    @discardableResult
    func selectedSegmentIndex(_ selectedSegmentIndex : Int) -> XPChain {
        object.selectedSegmentIndex = selectedSegmentIndex
        return self
    }
    
    @discardableResult
    func setBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State, barMetrics: UIBarMetrics) -> XPChain {
        object.setBackgroundImage(backgroundImage, for: state, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func setDividerImage(_ dividerImage: UIImage?, forLeftSegmentState leftState: UIControl.State, rightSegmentState rightState: UIControl.State, barMetrics: UIBarMetrics) -> XPChain {
        object.setDividerImage(dividerImage, forLeftSegmentState: leftState, rightSegmentState: rightState, barMetrics: barMetrics)
        return self
    }
    
    @discardableResult
    func setTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State) -> XPChain {
        object.setTitleTextAttributes(attributes, for: state)
        return self
    }
    
    @discardableResult
    func setContentPositionAdjustment(_ adjustment: UIOffset, forSegmentType leftCenterRightOrAlone: UISegmentedControl.Segment, barMetrics: UIBarMetrics) -> XPChain {
        object.setContentPositionAdjustment(adjustment, forSegmentType: leftCenterRightOrAlone, barMetrics: barMetrics)
        return self
    }
}
