//
//  UIDatePickerView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIDatePicker {
    
    @discardableResult
    func datePickerMode(_ datePickerMode : UIDatePicker.Mode) -> XPChain {
        object.datePickerMode = datePickerMode
        return self
    }
    
    @discardableResult
    func locale(_ locale : Locale?) -> XPChain {
        object.locale = locale
        return self
    }
    
    @discardableResult
    func calendar(_ calendar : Calendar!) -> XPChain {
        object.calendar = calendar
        return self
    }
    
    @discardableResult
    func timeZone(_ timeZone : TimeZone?) -> XPChain {
        object.timeZone = timeZone
        return self
    }
    
    @discardableResult
    func date(_ date : Date) -> XPChain {
        object.date = date
        return self
    }
    
    @discardableResult
    func minimumDate(_ minimumDate : Date?) -> XPChain {
        object.minimumDate = minimumDate
        return self
    }
    
    @discardableResult
    func maximumDate(_ maximumDate : Date?) -> XPChain {
        object.maximumDate = maximumDate
        return self
    }
    
    @discardableResult
    func countDownDuration(_ countDownDuration : TimeInterval) -> XPChain {
        object.countDownDuration = countDownDuration
        return self
    }
    
    @discardableResult
    func minuteInterval(_ minuteInterval : Int) -> XPChain {
        object.minuteInterval = minuteInterval
        return self
    }
    
    @discardableResult
    func setDate(_ date: Date, animated: Bool) -> XPChain {
        object.setDate(date, animated: animated)
        return self
    }

}
