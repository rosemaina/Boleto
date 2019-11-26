//
//  SchedulesViewController.swift
//  Boleto
//
//  Created by Rose Maina on 11/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

class SchedulesViewController: UIViewController {
    
    // MARK: - Public Instance Properties
    
    var viewModel: SchedulesViewModel?
    
    let reuseID = "ScheduleTableViewCellID"
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Overriden Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Schedules"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.borderColor = .gray
        self.tableView.layer.borderWidth = 1
        self.tableView.layer.cornerRadius = 10
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        self.tableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: reuseID)
    }
    
    // MARK: - Private Instance Methods
    
    private func presentPay(_ schedule: Schedule) {
        
        let viewModel = PaymentViewModel(client: self.viewModel!.client, schedule: schedule)
        
        let paymentVC = PaymentOnboardingViewController.instantiate(fromAppStoryboard: .Schedules)
        paymentVC.viewModel = viewModel
        
        self.navigationController?.pushViewController(paymentVC, animated: true)
    }
}

extension SchedulesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel?.schedules?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let vm = viewModel else {
            return UITableViewCell()
        }
        
        guard let schedule = vm.schedules?[indexPath.section].schedules[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! ScheduleTableViewCell
        
        cell.departureLabel.text = "Departure: \(schedule.departure!)"
        cell.destinationLabel.text = schedule.destination!
        cell.typeLabel.text = "Type: \(schedule.type!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vm = viewModel else {
            return
        }
        
        let schedule = vm.schedules?[indexPath.section].schedules[indexPath.row]
        
        self.presentPay(schedule!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.schedules?[section].schedules.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let vm = self.viewModel else {
            return nil
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 120))
        label.backgroundColor = UIColor.white
        label.font = UIFont.font(face: .hankenSansBold, size: 20)
        label.text = vm.schedules?[section].title
        label.textAlignment = .center
        
        return label
    }
}
