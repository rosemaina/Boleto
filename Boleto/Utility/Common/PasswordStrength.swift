//
//  PasswordStrength.swift
//  Tikiti
//
//  Created by Rose Maina on 28/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation
import UIKit

// https://gist.github.com/chamrc/4b74d0f6caa844116150
enum Strength: Int {
    case none
    case weak
    case moderate
    case strong
}

class PasswordStrength {
    
    static func checkStrength(password: String) -> Strength {
        var strength: Int = 0
        
        switch password.count {
        case 0:
            return .none
        case 1...4:
            strength += 1
        case 5...8:
            strength += 2
        default:
            strength += 3
        }
        
        // Upper case, Lower case, Number & Symbols
        let patterns = ["^(?=.*[A-Z]).*$", "^(?=.*[a-z]).*$", "^(?=.*[0-9]).*$", "^(?=.*[!@#%&-_=:;\"'<>,`~\\*\\?\\+\\[\\]\\(\\)\\{\\}\\^\\$\\|\\\\\\.\\/]).*$"]
        
        for pattern in patterns {
            if (password.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil) {
                strength += 1
            }
        }
        
        switch strength {
        case 0:
            return .none
        case 1...3:
            return .weak
        case 4...6:
            return .moderate
        default:
            return .strong
        }
    }
    
    class func isValid(password: String) -> Bool {
        if password.isEmpty == false && password.count >= 8 {
            return true
        } else {
            return false
        }
    }
}

extension PasswordStrength {
    class func strength(forPassword password: String) -> NSAttributedString {
        switch checkStrength(password: password) {
        case .none:
            return NSAttributedString(string: "")
        case .weak:
            return NSAttributedString(string: "Weak", attributes: [
                .foregroundColor: UIColor.mobilitiRed,
                .font: UIFont.font(face: .hankenSansRegular, size: 12)
                ])
        case .moderate:
            return NSAttributedString(string: "Medium", attributes: [
                .foregroundColor: UIColor.mobilitiOrange,
                .font: UIFont.font(face: .hankenSansRegular, size: 12)
                ])
        case .strong:
            return NSAttributedString(string: "Strong", attributes: [
                .foregroundColor: UIColor.mobilitiGreen,
                .font: UIFont.font(face: .hankenSansRegular, size: 12)
                ])
        }
    }
}
