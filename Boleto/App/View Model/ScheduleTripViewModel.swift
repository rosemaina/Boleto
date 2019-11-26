//
//  ScheduleTripViewModel.swift
//  Boleto
//
//  Created by Rose Maina on 23/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation

class ScheduleTripViewModel: BaseViewModel {
    
    // MARK: - Public Intance Properties
    
    var `class`: String?
    var date: Date?
    var time: Date?
    
    var sc: [ScheduleContainer]?
    
    var shouldFetchSchedules: Bool {
        
        guard self.class != nil, self.date != nil, self.time != nil else {
            return false
        }
        
        return true
    }
    
    // MARK: - Public Intance Method
    
    func fetchTripSchedules(completion: @escaping (Bool) -> Void) {
        
        self.client.fetchSchedules { (containers) in
            self.sc = containers
            completion(true)
        }
    }
}
