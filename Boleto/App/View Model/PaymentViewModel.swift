//
//  PaymentViewModel.swift
//  Boleto
//
//  Created by Rose Maina on 25/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation

class PaymentViewModel: BaseViewModel {
    
    var schedule: Schedule
    
    init(client: BoletoClient, schedule: Schedule) {
        
        self.schedule = schedule
        super.init(client: client)
    }
}
