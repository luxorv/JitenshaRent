//
//  AuthViewPresenter.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation

protocol AuthViewPresenter {
    init(view: AuthView)
    
    func changeAuthenticationType()
    func authenticateUser(email: String, password: String)
    
    
    //func completeAuthentication()
}