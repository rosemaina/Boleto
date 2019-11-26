//
//  Schedule.swift
//  Boleto
//
//  Created by Rose Maina on 25/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation

enum BusType: String, Codable {
    case business = "BUSINESS"
    case normal = "NORMAL"
    case vip = "VIP"
}

struct Schedule: Codable {
    
    let departure: String?
    let destination: String?
    let origin: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case departure = "DEPARTURE"
        case destination = "DESTINATION"
        case origin = "ORIGIN"
        case type = "TYPE"
    }
    
    init(from dict: [String: Any]) {
        
        departure = dict[CodingKeys.departure.rawValue] as? String
        destination = dict[CodingKeys.destination.rawValue] as? String
        origin = dict[CodingKeys.origin.rawValue] as? String
        type = dict[CodingKeys.type.rawValue] as? String
    }
}
