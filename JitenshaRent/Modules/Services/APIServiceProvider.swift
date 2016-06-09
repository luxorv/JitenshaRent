//
//  APIServiceProvider.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIServiceProvider {
    
    // MARK: Properties
    
    static var isRequestSuccessful = false
    
    // MARK: Class Methods
    
    func requestGETURL(strURL: String, headers: [String: String]?, success:(JSON) -> Void, failure:(NSError) -> Void) {
        Alamofire.request(.GET, strURL, headers: headers).responseJSON { (responseObject) -> Void in
            
            let statusCode = (responseObject.response?.statusCode)!
            
            print("Status Code: \(statusCode) | \(headers) and \(strURL))")
            
            if ClientErrors.isValidResponse(statusCode) {
                let resJson = JSON(responseObject.result.value!)
                
                success(resJson)
            } else {
                
                let error : NSError = NSError(domain: "Bad Response", code: statusCode, userInfo: nil)
                failure(error)
            }
        }
    }
    
    func requestPOSTURL(strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:(JSON) -> Void, failure:(NSError) -> Void) {
        
        Alamofire.request(.POST, strURL, parameters: params, encoding: ParameterEncoding.JSON, headers: headers).responseJSON { (responseObject) -> Void in

            let statusCode = (responseObject.response?.statusCode)!
            
            print("Status Code: \(statusCode) | \(params) and \(strURL))")
            
            if ClientErrors.isValidResponse(statusCode) {
                let resJson = JSON(responseObject.result.value!)
                
                success(resJson)
            } else {
                
                let error : NSError = NSError(domain: "Bad Response", code: statusCode, userInfo: nil)
                failure(error)
            }
        }
    }
    
    func requestURL(requestType: RequestType) -> String {
        
        switch requestType {
            case .LOGIN:
                return AuthUtilsProvider.LOGIN_URL
            case .REGISTER:
                return AuthUtilsProvider.REGISTER_URL
            case .PLACES:
                return AuthUtilsProvider.PLACES_URL
            case .PAYMENT:
                return AuthUtilsProvider.RENT_URL
        }
    }
    
    func request(data: [String: String], requestType: RequestType, method: Alamofire.Method, successCallback:(JSON) -> Void, failureCallback:(NSError) -> Void) {
        
        switch method {
            case .POST:
                
                self.requestPOSTURL(
                    self.requestURL(requestType),
                    params: data,
                    headers: AuthUtilsProvider.REQUEST_HEADERS,
                    success: successCallback,
                    failure: failureCallback
                )
    
            case .GET:
                
                self.requestGETURL(
                    self.requestURL(requestType),
                    headers: data,
                    success: successCallback,
                    failure: failureCallback
                )
            
            default:
                break
        }
    }
}