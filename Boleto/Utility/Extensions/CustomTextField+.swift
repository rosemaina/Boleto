//
//  CustomTextField+.swift
//  Tikiti
//
//  Created by Rose Maina on 22/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Material

extension ErrorTextField {
    
    func inValidate(error: String?) {
        if let error = error {
            self.error = error
            self.isErrorRevealed = true
            self.dividerNormalColor = .mobilitiRed
            self.dividerNormalHeight = 2.0
            self.dividerActiveColor = .mobilitiRed
            self.dividerActiveHeight = 2.0
        } else {
            self.isErrorRevealed = false
            self.dividerNormalColor = UIColor.mobilitiGrey(alpha: 0.2)
            self.dividerNormalHeight = 1.0
            self.dividerActiveColor = .mobilitiTeal
            self.dividerActiveHeight = 2.0
        }
    }
    
    override func theme() {
        super.theme()
        
        self.errorColor = .mobilitiRed
    }
}
