//
//  ScheduleTableViewCell.swift
//  Boleto
//
//  Created by Rose Maina on 24/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    // MARK: - Public Instance Properties
    
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    // MARK: - Overriden Method
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
}
