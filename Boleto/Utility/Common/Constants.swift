//
//  Constants.swift
//  Tikiti
//
//  Created by Rose Maina on 20/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


class Constants: NSObject {
    
    struct UserDefault {
        static let IsAppOpenedBefore = "isAppOpenedBefore"
        static let FilterData = "FilterData"
        static let FilterDetail = "FilterDetail"
        static let needToShowCarList = "isNeedToShowCarList"
        static let needToShowAll = "NeedsToShowAll"
        static let address = "address"
        static let postalCode = "postalCode"
        static let locationName = "LocationName"
        static let customerId = "CustomerId"
        static let stripeId = "StripeId"
        static let token = "Token"
        static let deviceId = "DeviceId"
        static let userType = "UserType"
        static let UserFullName = "UserFullName"
        static let UserType = "UserType"
        static let SwapVehicle = "Swap Vehicle"
        static let selectedCardId = "SelectedCardID"
        static let currentMarketId = "1"
        
        static let userEmail = "userEmail"
        
        static let firstNameRegister = "FirstName_Register"
        static let lastNameRegister = "LastName_Register"
        static let emailRegister = "email_Register"
        static let phoneRegister = "phone_Register"
        
        static let notificationBadge = "NotificationBedge"
        
        static let tempCustomerId = "tempCustomerId"
        
        static let loggedIn = "logged_in"
        static let customerStatus = "customerStatus"
        static let isUpdateLocation = "isUpdateLocation"
        static let isResetFilter = "isResetFilter"
        static let isFromHomeTabVC = "isFromHomeTabVC"
        static let IntercomStart = "Intercom-start"
        
        static let refreshToken = "RefreshToken"
        static let insuranceAgeSelected = "InsuranceAgeSelected"
        
    }
}

public var recentBadgeHandler: ListenerRegistration?
let userDefaults = UserDefaults.standard

//MARK:- NOTIFICATIONS
public let USER_DID_LOGIN_NOTIFICATION = "UserDidLoginNotification"
public let APP_STARTED_NOTIFICATION = "AppStartedNotification"

//MARK:- IDs and KEYS
public let kFILEREFERENCE = ""
public let kONESIGNALAPPID = ""
public let kSINCHKEY = ""
public let kSINCHSECRET = ""
public let kAPPURL = ""

//MARK:- FIREBASE HEADERS
public let kUSER_PATH = "User"
public let kTYPINGPATH_PATH = "Typing"
public let kRECENT_PATH = "Recent"
public let kMESSAGE_PATH = "Message"
public let kGROUP_PATH = "Group"
public let kCALL_PATH = "Call"

//MARK:- FUSER
public let kOBJECTID = "objectId"
public let kCREATEDAT = "createdAt"
public let kUPDATEDAT = "updatedAt"
public let kEMAIL = "email"
public let kPHONE = "phone"
public let kCOUNTRYCODE = "countryCode"
public let kFACEBOOK = "facebook"
public let kLOGINMETHOD = "loginMethod"
public let kPUSHID = "pushId"
public let kFIRSTNAME = "firstname"
public let kLASTNAME = "lastname"
public let kFULLNAME = "fullname"
public let kAVATAR = "avatar"
public let kCURRENTUSER = "currentUser"
public let kISONLINE = "isOnline"
public let kVERIFICATIONCODE = "firebase_verification"
public let kCITY = "city"
public let kCOUNTRY = "country"
public let kBLOCKEDUSERID = "blockedUserId"

// MARK: PROFILE
public let kBACKGROUBNDIMAGE = "backgroundImage"
public let kSHOWAVATAR = "showAvatar"
public let kPASSWORDPROTECT = "passwordProtect"
public let kFIRSTRUN = "firstRun"
public let kNUMBEROFMESSAGES = 10
public let kMAXDURATION = 120.0
public let kAUDIOMAXDURATION = 120.0
public let kSUCCESS = 2

//MARK:- RECENTS
public let kCHATROOMID = "chatRoomID"
public let kUSERID = "userId"
public let kDATE = "date"
public let kPRIVATE = "private"
public let kGROUP = "group"
public let kGROUPID = "groupId"
public let kRECENTID = "recentId"
public let kMEMBERS = "members"
public let kMESSAGE = "message"
public let kMEMBERSTOPUSH = "membersToPush"
public let kDISCRIPTION = "discription"
public let kLASTMESSAGE = "lastMessage"
public let kCOUNTER = "counter"
public let kTYPE = "type"
public let kWITHUSERUSERNAME = "withUserUserName"
public let kWITHUSERUSERID = "withUserUserID"
public let kOWNERID = "ownerID"
public let kSTATUS = "status"
public let kMESSAGEID = "messageId"
public let kNAME = "name"
public let kSENDERID = "senderId"
public let kSENDERNAME = "senderName"
public let kTHUMBNAIL = "thumbnail"
public let kISDELETED = "isDeleted"

//MARK:- CONTACTS
public let kCONTACT = "contact"
public let kCONTACTID = "contactId"

//MARK:- MESSAGE TYPES
public let kPICTURE = "picture"
public let kTEXT = "text"
public let kVIDEO = "video"
public let kAUDIO = "audio"
public let kLOCATION = "location"

//MARK:- COORDINATES
public let kLATITUDE = "latitude"
public let kLONGITUDE = "longitude"

//MARK:- MESSAGE STATUS
public let kDELIVERED = "delivered"
public let kREAD = "read"
public let kREADDATE = "readDate"
public let kDELETED = "deleted"

//MARK:- PUSH
public let kDEVICEID = "deviceId"

//MARK:- CALLS
public let kISINCOMING = "isIncoming"
public let kCALLERID = "callerId"
public let kCALLERFULLNAME = "callerFullName"
public let kCALLSTATUS = "callStatus"
public let kWITHUSERFULLNAME = "withUserFullName"
public let kCALLERAVATAR = "callerAvatar"
public let kWITHUSERAVATAR = "withUserAvatar"
