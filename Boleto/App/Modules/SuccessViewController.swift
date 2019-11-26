//
//  SuccessViewController.swift
//  Boleto
//
//  Created by Rose Maina on 25/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Lottie
import UIKit

class SuccessViewController: UIViewController {
    
    // MARK: - Public Instance Properties
    
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var lottieView: UIView!
    @IBOutlet weak var successView: UIView!
    
    // Initialize success lottie animation
       public let resultAnimation: AnimationView = {
           let view = AnimationView()
           view.contentMode = .scaleAspectFill
           view.translatesAutoresizingMaskIntoConstraints = false

           return view
       }()
    
    // MARK: - Public Instance Methods
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        lottieView.addSubview(resultAnimation)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        successView.borderColor = .gray
        successView.layer.borderWidth = 1
        successView.layer.cornerRadius = 10
        
        okButton.layer.borderWidth = 1
        okButton.borderColor = .orange
        self.okButton.layer.cornerRadius = 10
        
        // Add success lottie animation
        let animation = Animation.named("success")
        resultAnimation.animation = animation
        resultAnimation.backgroundBehavior = .pauseAndRestore
        resultAnimation.play()
        
        resultAnimation.centerXAnchor.anchorWithOffset(to: lottieView.centerXAnchor)
        resultAnimation.centerYAnchor.anchorWithOffset(to: lottieView.centerYAnchor)
        resultAnimation.widthAnchor.constraint(equalToConstant: 100).isActive = true
        resultAnimation.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
