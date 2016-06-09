//
//  AuthServiceProvider.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation
import SwiftyJSON

class AuthServiceProvider: NSObject {
    
    // MARK: Properties
    
    var user: User
    
    let apiServiceProvider: APIServiceProvider
    
    // MARK: Initialization
    
    init(user: User) {
        self.user = user
        self.apiServiceProvider = APIServiceProvider()
    }
    
    // MARK: Class Functions
    
    func authenticate(user: User, requestType: RequestType, successCallback:(JSON) -> Void, failureCallback:(NSError) -> Void) {
        
        self.user = user
        
        self.apiServiceProvider.request(
            ["email": user.email, "password": user.password],
            requestType: requestType,
            method: .POST,
            successCallback: successCallback,
            failureCallback: failureCallback
        )
    }
}