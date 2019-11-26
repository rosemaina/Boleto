//
//  TextField+.swift
//  Tikiti
//
//  Created by Rose Maina on 22/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Material

extension TextField {
    
    @objc
    func theme() {
        self.font = UIFont(name: "HankenSans-Regular", size: 22)
        self.textColor = .mobilitiBlue
        
        self.placeholderNormalColor = UIColor.mobilitiGrey(alpha: 0.3)
        self.placeholderActiveColor = UIColor.mobilitiGrey(alpha: 0.3)
        self.placeholderVerticalOffset = 15.0
        self.placeholderActiveScale = 0.6363
        
        self.dividerNormalColor = UIColor.mobilitiGrey(alpha: 0.2)
        self.dividerNormalHeight = 1.0
        self.dividerActiveColor = .mobilitiTeal
        self.dividerActiveHeight = 2.0
    }
    
}
