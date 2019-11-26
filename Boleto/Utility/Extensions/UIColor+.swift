//
//  UIColor+.swift
//  Tikiti
//
//  Created by Rose Maina on 22/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mobilitiRed: UIColor {
        return #colorLiteral(red: 0.63, green: 0.11, blue: 0.13, alpha: 1.0)
    }
    
    static var mobilitiOrange: UIColor {
        return #colorLiteral(red: 0.84, green: 0.39, blue: 0.12, alpha: 1.0)
    }
    
    static var mobilitiGreen: UIColor {
        return #colorLiteral(red: 0.15, green: 0.66, blue: 0.44, alpha: 1.0)
    }
    
    static var mobilitiTeal: UIColor {
        return #colorLiteral(red: 0.29, green: 0.59, blue: 0.68, alpha: 1.0)
    }
    
    static var mobilitiBlue: UIColor {
        return #colorLiteral(red: 0.11, green: 0.19, blue: 0.33, alpha: 1.0)
    }
    
    static func mobilitiGrey(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 0.11, green: 0.19, blue: 0.33, alpha: alpha)
    }
}
