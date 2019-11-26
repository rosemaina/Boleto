//
//  UIViewController+.swift
//  Tikiti
//
//  Created by Rose Maina on 20/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit
import Foundation

public enum AppStoryboard: String {

    case BusSchedules
    case Main
    case Onboarding
    case Profile
    case Schedules
    case SignIn
    case SignUp
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type, identifier: String? = nil) -> T {
        let storyboardId = identifier ?? (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardId) as? T else {
            fatalError("Viewcontroller with ID \(storyboardId), not found in \(self.rawValue) Storyboard")
        }
        
        return scene
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    public static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard, withIdentifier identifier: String? = nil) -> Self {
        return appStoryboard.viewController(viewControllerClass: self, identifier: identifier)
    }    
}
