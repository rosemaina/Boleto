//
//  PaymentOnboardingViewController.swift
//  Boleto
//
//  Created by Rose Maina on 21/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit
import FLAnimatedImage

class PaymentOnboardingViewController: UIViewController {
    
    // MARK: - Public Instance Properties
    
    var viewModel: PaymentViewModel?

    let reuseID = "ScheduleTableViewCellID"
    
    // MARK: - Private Instance Properties
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var mpesaLabel: UILabel!
    @IBOutlet weak var mpesaAmountView: UIView!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var paymentImage: FLAnimatedImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Override Methods
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tableView.borderColor = .gray
        self.tableView.layer.borderWidth = 1
        self.tableView.layer.cornerRadius = 10
        
        self.mpesaAmountView.borderColor = .gray
        self.mpesaAmountView.layer.borderWidth = 1
        self.mpesaAmountView.layer.cornerRadius = 10
        
        
        self.payButton.borderColor = .white
        self.payButton.layer.borderWidth = 1
        self.payButton.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: reuseID)
        self.tableView.tableFooterView = UIView()
    }
    
    // MARK: - Public Instance Methods
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.addBlurView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.view.removeBlurView()
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.screenshotView(view: self.tableView)
            
            let successVC = SuccessViewController.instantiate(fromAppStoryboard: .Schedules)
            self.navigationController?.pushViewController(successVC, animated: true)
        }
    }
    
    private func screenshotView(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
}

// MARK: - UITableView DataSource And Delegate Methods

extension PaymentOnboardingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let vm = self.viewModel else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! ScheduleTableViewCell
        
        let schedule = vm.schedule
        
        cell.departureLabel.text = "Departure: \(schedule.departure!)"
        cell.destinationLabel.text = schedule.destination!
        cell.typeLabel.text = "Type: \(schedule.type!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let _ = self.viewModel else {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let _ = self.viewModel else {
            return nil
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 120))
        label.backgroundColor = UIColor.white
        label.font = UIFont.font(face: .hankenSansBold, size: 20)
        label.text = "Trip Details"
        label.textAlignment = .center
        
        return label
    }
}
