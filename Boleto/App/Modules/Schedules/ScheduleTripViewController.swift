//
//  ScheduleTripViewController.swift
//  Boleto
//
//  Created by Rose Maina on 21/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

class ScheduleTripViewController: UIViewController {
    
    // MARK: - Public Instance Properties
    
    var containerView: UIView?
    var viewModel: ScheduleTripViewModel?
    
    @IBOutlet weak var scheduleBtn: UIButton!
    
    // MARK: - Overriden Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.scheduleBtn.borderColor = .white
        self.scheduleBtn.layer.borderWidth = 1
        self.scheduleBtn.layer.cornerRadius = 10
    }
    
    // MARK: - Public Instance Properties
    
    @IBAction func chooseTimeTapped(_ sender: UIButton) {
        
        self.addDatePicker(mode: .time, selector: #selector(timePickerTapped(sender:)))
    }
    
    @IBAction func selectClassTapped(_ sender: UIButton) {
        
        self.addClassSheet()
    }
    
    @IBAction func selectDateTapped(_ sender: UIButton) {
        
        self.addDatePicker(mode: .date, selector: #selector(datePickerTapped(sender:)))
    }
    
    @IBAction func scheduleTapped(_ sender: UIButton) {
        
        guard let vm = self.viewModel else {
            return
        }
        
        guard vm.shouldFetchSchedules else {
            return
        }
        
        self.view.addBlurView()
        
        vm.fetchTripSchedules { (finished) in
            
            guard finished else {
                return
            }
            
            self.view.removeBlurView()
            
            let busSchedulesVC = SchedulesViewController.instantiate(fromAppStoryboard: .Schedules)
            
            let viewModel = SchedulesViewModel(client: vm.client)
            
            let busType = vm.class
            
            let schedules = vm.sc?.first?.schedules.filter { (schedule) -> Bool in
                if schedule.type == busType {
                    return true
                }
                return false
            }
            
//            let schedules = vm.sc?.first?.schedules.filter { (schedule) -> Bool in
//                let date = self.formatDate(schedule.departure ?? "")
//                if schedule.type == busType, date > (self.viewModel?.date)! {
//                    return true
//                }
//                return false
//            }
            
            let schedulesContainer = ScheduleContainer(title: vm.sc?.first?.title ?? "", schedules: schedules!)
            viewModel.schedules = [schedulesContainer]
            
            busSchedulesVC.viewModel = viewModel
    
            self.navigationController?.pushViewController(busSchedulesVC, animated: true)
        }
    }
    
    // MARK: - Private Instance Methods
    
    private func formatDate(_ str: String) -> Date {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "HH:MM a"
           if let date = dateFormatter.date(from: str) {
               return date
           }
           return Date()
       }
    
    private func addDatePicker(mode: UIDatePicker.Mode, selector: Selector) {
        
        let containerView = UIView(frame: CGRect(x: 0, y: view.bounds.maxY - 200, width: view.bounds.width, height: 200))
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: containerView.bounds.maxY - 150, width: view.bounds.width, height: 150))
        
        datePicker.addTarget(self, action: selector, for: .valueChanged)
        datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = mode
        
        let today = Date()
        
        datePicker.minimumDate = today
        
        var components = DateComponents()
        components.day = 7
        
        datePicker.maximumDate = Calendar.current.date(byAdding: components, to: today)
        
        let toolbar = self.doneToolBar(selector: #selector(doneBtnTapped))
        toolbar.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        containerView.addSubview(toolbar)
        containerView.addSubview(datePicker)
        
        self.containerView = containerView
        
        view.addSubview(containerView)
    }
    
    private func addClassSheet() {
        
        let toolbar = self.doneToolBar(selector: #selector(doneBtnTapped))
        toolbar.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        let classSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let vipAction = UIAlertAction(title: BusType.vip.rawValue, style: .default) { (action) in
            self.setClass(action.title)
        }
        
        let businessAction = UIAlertAction(title: BusType.business.rawValue, style: .default) { (action) in
            self.setClass(action.title)
        }
        
        let okAction = UIAlertAction(title: BusType.normal.rawValue, style: .default) { (action) in
            self.setClass(action.title)
        }
        
        classSheet.addAction(vipAction)
        classSheet.addAction(businessAction)
        classSheet.addAction(okAction)
        
        self.present(classSheet, animated: true, completion: nil)
    }
    
    private func setClass(_ str: String?) {
        self.viewModel?.class = str
    }
    
    func doneToolBar(selector: Selector) -> UIToolbar {
        
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.blue]
        
        let doneToolBar: UIToolbar = .init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: target, action: selector)
        
        done.setTitleTextAttributes(attributes, for: .normal)
        done.setTitleTextAttributes(attributes, for: .highlighted)
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        return doneToolBar
    }
    
    // MARK: - @objc Private Methods
    
    @objc
    private func datePickerTapped(sender: UIDatePicker) {
        
        self.viewModel?.date = sender.date
    }
    
    @objc
    private func doneBtnTapped() {
        
        self.containerView?.removeFromSuperview()
        view.layoutIfNeeded()
    }
    
    @objc
    private func timePickerTapped(sender: UIDatePicker) {
        
        self.viewModel?.time = sender.date
    }
}
