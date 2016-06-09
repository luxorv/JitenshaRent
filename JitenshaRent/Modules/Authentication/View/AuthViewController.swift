//
//  ViewController.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/18/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, AuthView {

    // MARK: Properties
    
    var authPresenter: AuthViewPresenter!
    var shouldChangeAuthenticationType: Bool = false
    
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var authLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        authPresenter = AuthPresenter(view: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func registerForm(sender: UITapGestureRecognizer) {
        authPresenter.changeAuthenticationType()
    }
    

    @IBAction func authenticate(sender: UIButton) {
        authPresenter.authenticateUser(emailTextField.text!, password: passwordTextField.text!)
    }
    
    // MARK Class Functions
    
    func changeAuthenticationLabel() {
        if self.shouldChangeAuthenticationType {
            authLabel.text = AuthUtilsProvider.REGISTER_LABEL_TAPPED
            authButton.setTitle(AuthUtilsProvider.REGISTER, forState: .Normal)
            
        } else {
            authLabel.text = AuthUtilsProvider.LOGIN_LABEL_TAPPED
            authButton.setTitle(AuthUtilsProvider.LOGIN, forState: .Normal)
        }
    }
    
    func performSegue() {
        
        performSegueWithIdentifier("ContentSegue", sender: self)
        
    }
    

}

