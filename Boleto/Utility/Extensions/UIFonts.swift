//
//  UIFonts.swift
//  Tikiti
//
//  Created by Rose Maina on 28/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum Face: String {
        case hankenSansRegular = "HankenSans-Regular"
        case hankenSansBold = "HankenSans-Bold"
        case hankenSansMedium = "HankenSans-Medium"
    }
    
    static func font(face: Face, size: CGFloat) -> UIFont {
        return UIFont(name: face.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
