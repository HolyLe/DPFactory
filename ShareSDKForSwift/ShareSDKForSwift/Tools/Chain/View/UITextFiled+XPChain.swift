//
//  UITextFiled+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UITextField {
    
    @discardableResult
    func attributedText(_ attributedText : NSAttributedString?) -> XPChain {
        object.attributedText = attributedText
        return self
    }
    
    @discardableResult
    func textColor(_ textColor : UIColor?) -> XPChain {
        object.textColor = textColor
        return self
    }
    
    @discardableResult
    func font(_ font : UIFont?) -> XPChain {
        object.font = font
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment : NSTextAlignment) -> XPChain {
        object.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func borderStyle(_ borderStyle : UITextField.BorderStyle) -> XPChain {
        object.borderStyle = borderStyle
        return self
    }
    
    @discardableResult
    func defaultTextAttributes(_ defaultTextAttributes : [NSAttributedString.Key : Any]) -> XPChain {
        object.defaultTextAttributes = defaultTextAttributes
        return self
    }
    
    @discardableResult
    func placeholder(_ placeholder : String?) -> XPChain {
        object.placeholder = placeholder
        return self
    }
    
    @discardableResult
    func attributedPlaceholder(_ attributedPlaceholder : NSAttributedString?) -> XPChain {
        object.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    @discardableResult
    func clearsOnBeginEditing(_ clearsOnBeginEditing : Bool) -> XPChain {
        object.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth : Bool) -> XPChain {
        object.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    @discardableResult
    func minimumFontSize(_ minimumFontSize : CGFloat) -> XPChain {
        object.minimumFontSize = minimumFontSize
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : UITextFieldDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func background(_ background : UIImage?) -> XPChain {
        object.background = background
        return self
    }
    
    @discardableResult
    func disabledBackground(_ disabledBackground : UIImage?) -> XPChain {
        object.disabledBackground = disabledBackground
        return self
    }
    
    @discardableResult
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes : Bool) -> XPChain {
        object.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    @discardableResult
    func typingAttributes(_ typingAttributes : [NSAttributedString.Key:Any]) -> XPChain {
        object.typingAttributes = typingAttributes
        return self
    }
    
    @discardableResult
    func clearButtonMode(_ clearButtonMode : UITextField.ViewMode) -> XPChain {
        object.clearButtonMode = clearButtonMode
        return self
    }
    
    @discardableResult
    func leftView(_ leftView : UIView?) -> XPChain {
        object.leftView = leftView
        return self
    }
    
    @discardableResult
    func leftViewMode(_ leftViewMode : UITextField.ViewMode) -> XPChain {
        object.leftViewMode = leftViewMode
        return self
    }
    
    @discardableResult
    func rightView(_ rightView : UIView?) -> XPChain {
        object.rightView = rightView
        return self
    }
    
    @discardableResult
    func rightViewMode(_ rightViewMode : UITextField.ViewMode) -> XPChain {
        object.rightViewMode = rightViewMode
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
}
