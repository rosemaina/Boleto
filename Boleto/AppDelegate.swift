//
//  AppDelegate.swift
//  Boleto
//
//  Created by Rose Maina on 11/11/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

import GoogleSignIn
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var authListener: AuthStateDidChangeListenerHandle?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard let config = Bundle.main.path(forResource: "GoogleService-Info-Dev", ofType: "plist") else {
            fatalError("Missing Plist")
        }
        
        guard let options = FirebaseOptions(contentsOfFile: config) else {
            fatalError("Invalid Firebase configuration file.")
        }
        
        FirebaseApp.configure(options: options)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        authListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            Auth.auth().removeStateDidChangeListener(self.authListener!)
            
            if let user = user {
                DispatchQueue.main.async {
                    self.goToSchedules(user)
                }
            }
            else {
                DispatchQueue.main.async {
                    self.goToSplash()
                }
            }
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    @discardableResult
    private func goToSchedules(_ currentUser: User) -> Bool {
        let client = BoletoClient(user: currentUser)
        
        let viewModel = ScheduleTripViewModel(client: client)
        
        let scheduleTripVC = ScheduleTripViewController.instantiate(fromAppStoryboard: .Schedules)
        scheduleTripVC.viewModel = viewModel
        
        let navigationController = UINavigationController(rootViewController: scheduleTripVC)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    @discardableResult
    private func goToSplash() -> Bool {
        let splashVC = SignInViewController.instantiate(fromAppStoryboard: .SignIn)
        
        let navController = UINavigationController.init(rootViewController: splashVC)
        navController.navigationBar.isHidden = true
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

