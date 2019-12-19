//
//  SignInViewController.swift
//  Boleto
//
//  Created by Rose Maina on 15/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController {
    
    // MARK: - Private Instance Properties
    
    private struct ConstraintConstants {
        static let endSignInBottomConstraint: CGFloat = 69
        static let startSignInBottomConstraint: CGFloat = -24
        static let endBoletoTopConstraint: CGFloat = 80
        static let startBoletoTopConstraint: CGFloat = -40
    }
    
    // MARK: - Public Instance Properties
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var splashImageView: UIImageView!
    @IBOutlet weak var animatableView: UIView!
    @IBOutlet weak var signInBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var boletoLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimations()
        
        guard let instance = GIDSignIn.sharedInstance() else { return }
        
        instance.clientID = FirebaseApp.app()?.options.clientID // The client ID of the app
        instance.delegate = self
        instance.hostedDomain = "gmail.com"
        instance.presentingViewController = self
        
        self.signUpButton.borderColor = .white
        self.signUpButton.layer.borderWidth = 1
        self.signUpButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateViews()
        animateSwipeLabel()
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           signUpButton.layer.cornerRadius = 10
       }
    
    // MARK: - Public Instance Methods
      
      @IBAction func clickSignUp(_ sender: Any) {
          GIDSignIn.sharedInstance()?.signIn()
      }
    
    // MARK: - Public Instance Methods
    
    func startAnimations() {
        splashImageView.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
        animatableView.layer.cornerRadius = (animatableView.frame.size.width/2)
        signInBottomConstraint.constant = ConstraintConstants.startSignInBottomConstraint
        boletoLabelTopConstraint.constant = ConstraintConstants.startBoletoTopConstraint
    }
    
    func animateViews() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        self.splashImageView.transform = .identity
                        self.boletoLabelTopConstraint.constant = ConstraintConstants.endSignInBottomConstraint
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
    
    func animateSwipeLabel() {
        UIView.animate(withDuration: 1.5,
                       delay: 1,
                       usingSpringWithDamping: 0.30,
                       initialSpringVelocity: 5,
                       options: .curveEaseOut,
                       animations: {
                        self.signInBottomConstraint.constant = ConstraintConstants.endSignInBottomConstraint
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
}


extension UIViewController {
    
    func goToSchedules(_ currentUser: User) {
        let client = BoletoClient(user: currentUser)
        
        let viewModel = ScheduleTripViewModel(client: client)
        
        let scheduleTripVC = ScheduleTripViewController.instantiate(fromAppStoryboard: .Schedules)
        scheduleTripVC.viewModel = viewModel
        
        let navigationController = UINavigationController(rootViewController: scheduleTripVC)
        
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension SignInViewController: GIDSignInDelegate {
    
    // Google Sign In for User
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print("*************Error \(error.localizedDescription)*************")
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }
        
        // withIDToken: The token that identifies the user. Send it to your server to authenticate the user.
        // accessToken: The OAuth2 access token to access Google services
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            guard let currentUser = result?.user else {
                return
            }
            
            self.goToSchedules(currentUser)
        }
    }
}
