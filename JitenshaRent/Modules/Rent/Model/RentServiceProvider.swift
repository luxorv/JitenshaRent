//
//  RentServiceProvider.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/20/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation
import SwiftyJSON

class RentServiceProvider: NSObject {
    
    // MARK: Properties
    
    var userToken: String
    
    let apiServiceProvider: APIServiceProvider
    
    // MARK: Initialization
    
    init(userToken: String) {
        self.userToken = userToken
        self.apiServiceProvider = APIServiceProvider()
    }
    
    // MARK: Class Functions
    
    func rentAction(requestType: RequestType, successCallback:(JSON) -> Void, failureCallback:(NSError) -> Void) {
        
        self.apiServiceProvider.request(
            ["Authorization" : self.userToken],
            requestType: requestType,
            method: .GET,
            successCallback: successCallback,
            failureCallback: failureCallback
        )
        
    }
}