//
//  JRAuthService.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation

class AuthServiceProvider: NSObject {
    
    // MARK: Properties
    
    
    // MARK: Functions
    
    func validUser(email: String, password: String) -> Bool {
        
        let user = User(email: email, password: password)
        let response = APIServiceProvider.getFromAPI(user)
        
        if response["accessToken"] == "token"{
            return true
        }
        
        return false
    }
    
}