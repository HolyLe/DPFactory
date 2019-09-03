//
//  UITextView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UITextView {
    
    @discardableResult
    func delegate(_ delegate : UITextViewDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func text(_ text : String!) -> XPChain {
        object.text = text
        return self
    }
    
    @discardableResult
    func font(_ font : UIFont?) -> XPChain {
        object.font = font
        return self
    }
    
    @discardableResult
    func textColor(_ textColor : UIColor?) -> XPChain {
        object.textColor = textColor
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment : NSTextAlignment) -> XPChain {
        object.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func selectedRange(_ selectedRange : NSRange) -> XPChain {
        object.selectedRange = selectedRange
        return self
    }
    
    @discardableResult
    func isEditable(_ isEditable : Bool) -> XPChain {
        object.isEditable = isEditable
        return self
    }
    
    @discardableResult
    func isSelectable(_ isSelectable : Bool) -> XPChain {
        object.isSelectable = isSelectable
        return self
    }
    
    @discardableResult
    func dataDetectorTypes(_ dataDetectorTypes : UIDataDetectorTypes) -> XPChain {
        object.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    @discardableResult
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes : Bool) -> XPChain {
        object.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    @discardableResult
    func attributedText(_ attributedText : NSAttributedString!) -> XPChain {
        object.attributedText = attributedText
        return self
    }
    
    @discardableResult
    func typingAttributes(_ typingAttributes : [NSAttributedString.Key:Any]) -> XPChain {
        object.typingAttributes = typingAttributes
        return self
    }
    
    @discardableResult
    func scrollRangeToVisible(_ range: NSRange) -> XPChain {
        object.scrollRangeToVisible(range)
        return self
    }
    
    @discardableResult
    func inputView(_ inputView : UIView?) -> XPChain {
        object.inputView = inputView
        return self
    }
    
    @discardableResult
    func inputAccessoryView(_ inputAccessoryView : UIView?) -> XPChain {
        object.inputAccessoryView = inputAccessoryView
        return self
    }
    
    @discardableResult
    func clearsOnInsertion(_ clearsOnInsertion : Bool) -> XPChain {
        object.clearsOnInsertion = clearsOnInsertion
        return self
    }
    
    @discardableResult
    func textContainerInset(_ textContainerInset : UIEdgeInsets) -> XPChain {
        object.textContainerInset = textContainerInset
        return self
    }
    
}
