//
//  JRUser.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/18/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation

class User: NSObject {
    
    // MARK: Properties
    
    var email: String = ""
    var password: String = ""
    var accessToken: String = ""
    var lastUserEmail = "None"
    var isLoggedIn: Bool = false
    
    struct PropertyKey {
        static let emailKey = "email"
        static let passwordKey = "password"
        static let accessTokenKey = "accessToken"
        static let lastUserEmailKey = "lastUserEmail"
    }
    
    // MARK: Initialization
    
    override init() {
        super.init()
    }
    
    init?(email: String, password: String) {
        super.init()
        
        self.email = email
        self.password = password
        
        if self.email != self.lastUserEmail {
            print("returned nil")
            return nil
        }
    }

   
    // MARK: Functions
    
}