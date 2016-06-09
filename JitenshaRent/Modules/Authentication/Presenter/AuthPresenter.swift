//
//  JRLoginPresenter.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/18/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation
import SwiftyJSON

class AuthPresenter: AuthViewPresenter {
    
    // MARK: Properties
    
    unowned let view: AuthView
    let authServiceProvider: AuthServiceProvider
    
    var user: User
    var userWillRegister: Bool
    static var userLoaded: Bool = false
    
    // MARK: Initialization
    
    required init(view: AuthView) {
        self.view = view
        self.user = User()
        self.authServiceProvider = AuthServiceProvider(user: user)
        self.userWillRegister = false
        AuthPresenter.userLoaded = false
        
        if AuthPresenter.loadUser() {
            login()
        }
    }
    
    // MARK: Class Functions
    
    func changeAuthenticationType() {
        
        userWillRegister = !userWillRegister
        view.shouldChangeAuthenticationType = !view.shouldChangeAuthenticationType
        
        view.changeAuthenticationLabel()
    }
    
    func authenticateUser(email: String, password: String) {
        
        self.user.email = email
        self.user.password = password
        
        let requestType: RequestType = userWillRegister ? .REGISTER: .LOGIN
        
        if AuthPresenter.loadUser() {
            self.login()
        } else {
        
            authServiceProvider.authenticate(
                self.user,
                requestType: requestType,
                successCallback: self.successCallback,
                failureCallback: self.failureCallback
            )
        }
    }
    
    func login() {
        self.view.performSegue()
    }
    
    // MARK: Storage and Callbacks
    
    func saveUser() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.user.accessToken, forKey: User.PropertyKey.accessTokenKey)
    }
    
    static func loadUser() -> Bool {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let accessToken: String? = defaults.stringForKey(User.PropertyKey.accessTokenKey)
        
        if accessToken != nil {
            self.userLoaded = true
            return true
        }
        
        return false
    }
    
    func successCallback(responseJson: JSON) {
        
        self.user.accessToken = responseJson["accessToken"].stringValue
        print("Logged In")
        self.user.isLoggedIn = true
        self.saveUser()
        self.login()
    }
    
    func failureCallback(error: NSError) {
        user.isLoggedIn = false
        print("Error on Authentication! Error \(error.code)")
    }
}