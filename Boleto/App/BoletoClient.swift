//
//  BoletoClient.swift
//  Boleto
//
//  Created by Rose Maina on 22/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation
import Firebase

class BoletoClient {
    
    let user: User
    
    init(user: User) {
        
        self.user = user
    }
    
    static let databaseRef = Database.database().reference() // Gets a FIRDatabaseReference for the root of your Firebase Database
    
    func fetchSchedules(completion: @escaping ([ScheduleContainer]) -> Void) {
        
        let schedulesRef = "schedules/"
        
        BoletoClient.databaseRef.child(schedulesRef).observe(.value) { (snapshot) in
            
            guard let schedulesDict = snapshot.value as? [String: Any] else {
                return
            }
            
            let sc = schedulesDict.compactMap { (arg: (key: String, value: Any)) -> ScheduleContainer? in
                
                var schedules: [Schedule] = []
                
                for v in arg.value as! [[String: String]] {
                    schedules.append(Schedule(from: v))
                }
                
                let container = ScheduleContainer(title: arg.key, schedules: schedules)
                return container
            }
            
            completion(sc)
        }
    }
}
