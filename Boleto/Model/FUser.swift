//
//  FUser.swift
//  Boleto
//
//  Created by Rose Maina on 29/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FUser {
    
    let objectId: String
    var pushId: String?
    
    let createdAt: Date
    var updatedAt: Date
    
    var avatar: String
    var city: String
    var country:String
    var countryCode: String
    var email: String
    var firstname: String
    var fullname: String
    var isOnline: Bool
    var lastname: String
    var phoneNumber: String
    
    var contacts: [String]
    let loginMethod: String
    
    //MARK:- Initializers
    
    init(_objectId: String, _pushId: String?, _createdAt: Date, _updatedAt: Date, _email: String, _firstname: String, _lastname: String, _avatar: String = "", _loginMethod: String, _phoneNumber: String, _city: String, _country: String) {
        
        objectId = _objectId
        pushId = _pushId
        
        createdAt = _createdAt
        updatedAt = _updatedAt
        
        email = _email
        firstname = _firstname
        lastname = _lastname
        fullname = _firstname + " " + _lastname
        avatar = _avatar
        isOnline = true
        
        city = _city
        country = _country
        
        loginMethod = _loginMethod
        phoneNumber = _phoneNumber
        countryCode = ""
        contacts = []
    }
    
    init(_dictionary: NSDictionary) {
        objectId = _dictionary[kOBJECTID] as! String
        pushId = _dictionary[kPUSHID] as? String
        
        if let created = _dictionary[kCREATEDAT] {
            if (created as! String).count != 14 {
                createdAt = Date()
            } else {
                createdAt = DateFormatter().date(from: created as! String)!
            }
        } else {
            createdAt = Date()
        }
        
        if let updateded = _dictionary[kUPDATEDAT] {
            if (updateded as! String).count != 14 {
                updatedAt = Date()
            } else {
                updatedAt = DateFormatter().date(from: updateded as! String)!
            }
        } else {
            updatedAt = Date()
        }
        
        if let mail = _dictionary[kEMAIL] {
            email = mail as! String
        } else {
            email = ""
        }
        
        if let fname = _dictionary[kFIRSTNAME] {
            firstname = fname as! String
        } else {
            firstname = ""
        }
        
        if let lname = _dictionary[kLASTNAME] {
            lastname = lname as! String
        } else {
            lastname = ""
        }
        
        fullname = firstname + " " + lastname
        
        if let avat = _dictionary[kAVATAR] {
            avatar = avat as! String
        } else {
            avatar = ""
        }
        
        if let onl = _dictionary[kISONLINE] {
            isOnline = onl as! Bool
        } else {
            isOnline = false
        }
        
        if let phone = _dictionary[kPHONE] {
            phoneNumber = phone as! String
        } else {
            phoneNumber = ""
        }
        
        if let countryC = _dictionary[kCOUNTRYCODE] {
            countryCode = countryC as! String
        } else {
            countryCode = ""
        }
        
        if let cont = _dictionary[kCONTACT] {
            contacts = cont as! [String]
        } else {
            contacts = []
        }
        
        if let lgm = _dictionary[kLOGINMETHOD] {
            loginMethod = lgm as! String
        } else {
            loginMethod = ""
        }
        
        if let cit = _dictionary[kCITY] {
            city = cit as! String
        } else {
            city = ""
        }
        
        if let count = _dictionary[kCOUNTRY] {
            country = count as! String
        } else {
            country = ""
        }
    }
}
