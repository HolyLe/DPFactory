//
//  UILabel+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/20.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

public extension XPChain where Base : UILabel {
    
    @discardableResult
    func text(_ text: String?) -> XPChain {
        object.text = text
        return self
    }
    
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString?) -> XPChain {
        object.attributedText = attributedText
        return self
    }
    
    @discardableResult
    func textColor(_ textColor: UIColor) -> XPChain {
        object.textColor = textColor
        return self
    }
    
    
    @discardableResult
    func font(_ font: UIFont) -> XPChain {
        object.font = font
        return self
    }
    
    @discardableResult
    func lineBreakMode(_ lineBreakMode : NSLineBreakMode) -> XPChain {
        object.lineBreakMode = lineBreakMode
        return self
    }
    
    @discardableResult
    func highlightedTextColor(_ highlightedTextColor : UIColor) -> XPChain {
        object.highlightedTextColor = highlightedTextColor
        return self
    }
    
    @discardableResult
    func baselineAdjustment(_ baselineAdjustment : UIBaselineAdjustment) -> XPChain {
        object.baselineAdjustment = baselineAdjustment
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ isAdjust : Bool) -> XPChain {
        object.adjustsFontSizeToFitWidth = isAdjust
        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ minimumScaleFactor : CGFloat) -> XPChain {
        object.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult
    func systemFont(ofSize fontSize: CGFloat) -> XPChain {
        object.font = UIFont.systemFont(ofSize: fontSize)
        return self
    }
    
    @discardableResult
    func boldSystemFont(ofSize fontSize: CGFloat) -> XPChain {
        object.font = UIFont.boldSystemFont(ofSize: fontSize)
        return self
    }
    
    @available(iOS 9.0, *)
    @discardableResult
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation : Bool) -> XPChain {
        object.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    
    @discardableResult
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth : CGFloat) -> XPChain {
        object.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
    
    @discardableResult
    func numberOfLines(_ numberOfLines: Int) -> XPChain {
        object.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> XPChain {
        object.textAlignment = textAlignment
        return self
    }
    
    
    
}
