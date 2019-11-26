//
//  UIView+.swift
//  Boleto
//
//  Created by Rose Maina on 24/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addBlurView() {
        let effectView = UIBlurEffect(style: .dark)
        
        let blurView = UIVisualEffectView(effect: effectView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            self.addSubview(blurView)
        })
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        blurView.contentView.addSubview(activityIndicator)
        
        
        NSLayoutConstraint.activate([
            
//            blurView.widthAnchor.constraint(equalToConstant: 200),
//            blurView.heightAnchor.constraint(equalToConstant: 200),
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 50),
            activityIndicator.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        blurView.layer.cornerRadius = 5
        blurView.layer.masksToBounds = true
        
        activityIndicator.startAnimating()
    }
    
    func removeBlurView() {
        subviews.forEach { (subview) in
            
            guard subview.isKind(of: UIVisualEffectView.self) else {
                return
            }
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                subview.removeFromSuperview()
            })
        }
    }
}
