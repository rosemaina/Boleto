//
//  BaseViewModel.swift
//  Boleto
//
//  Created by Rose Maina on 23/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    let client: BoletoClient
    
    init(client: BoletoClient) {
        self.client = client
    }
}
