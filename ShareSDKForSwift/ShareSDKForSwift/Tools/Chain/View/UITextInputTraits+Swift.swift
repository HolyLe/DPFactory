//
//  UITextInputTraits+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UITextInputTraits{
    
    @discardableResult
    func autocapitalizationType(_ autocapitalizationType : UITextAutocapitalizationType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.autocapitalizationType = autocapitalizationType
        return self
    }
    
    @discardableResult
    func autocorrectionType(_ autocorrectionType : UITextAutocorrectionType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.autocorrectionType = autocorrectionType
        return self
    }
    
    @discardableResult
    func spellCheckingType(_ spellCheckingType : UITextSpellCheckingType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.spellCheckingType = spellCheckingType
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func smartQuotesType(_ smartQuotesType : UITextSmartQuotesType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.smartQuotesType = smartQuotesType
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func smartDashesType(_ smartDashesType : UITextSmartDashesType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.smartDashesType = smartDashesType
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func smartInsertDeleteType(_ smartInsertDeleteType : UITextSmartInsertDeleteType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.smartInsertDeleteType = smartInsertDeleteType
        return self
    }
    
    @discardableResult
    func keyboardType(_ keyboardType : UIKeyboardType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.keyboardType = keyboardType
        return self
    }
    
    @discardableResult
    func keyboardAppearance(_ keyboardAppearance : UIKeyboardAppearance) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.keyboardAppearance = keyboardAppearance
        return self
    }
    
    @discardableResult
    func returnKeyType(_ returnKeyType : UIReturnKeyType) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.returnKeyType = returnKeyType
        return self
    }
    
    @discardableResult
    func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically : Bool) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        return self
    }
    @available(iOS 10.0, *)
    @discardableResult
    func isSecureTextEntry(_ isSecureTextEntry : Bool) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.isSecureTextEntry = isSecureTextEntry
        return self
    }
    
    @discardableResult
    func textContentType(_ textContentType : UITextContentType!) -> XPChain {
        let insteadObjc  = object as! UITextView
        if #available(iOS 10.0, *) {
            insteadObjc.textContentType = textContentType
        }
        return self
    }
    @available(iOS 12.0, *)
    @discardableResult
    func passwordRules(_ passwordRules : UITextInputPasswordRules?) -> XPChain {
        let insteadObjc  = object as! UITextView
        insteadObjc.passwordRules = passwordRules
        return self
    }
}
