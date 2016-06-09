//
//  AuthUtils.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

enum RequestType {
    case LOGIN
    case REGISTER
    case PLACES
    case PAYMENT
}

enum DecodeError: ErrorType {
    case MissingProperty(String)
    case MalformedProperty(String)
    case NO_ERROR
}

enum ClientErrors : Int {
    case INVALID_JSON = 400
    case INVALID_CREDENTIALS = 401
    case INVALID_ACCESS_TOKEN = 403
    
    static func isValidResponse(statusCode: Int) -> Bool {
        
        switch statusCode {
            case INVALID_JSON.rawValue:
                return false
            case INVALID_CREDENTIALS.rawValue:
                return false
            case INVALID_ACCESS_TOKEN.rawValue:
                return false
            default:
                return true
        }
    }
}

public struct AuthUtilsProvider {
    
    static let API_URL = "http://luxorv.io:8080/api/v1/"
    static let LOGIN_URL = API_URL + "auth"
    static let REGISTER_URL = API_URL + "register"
    static let PLACES_URL = API_URL + "places"
    static let RENT_URL = API_URL + "rent"
    
    static let REQUEST_HEADERS = ["Content-Type": "application/json"]
    static let REGISTER_LABEL_TAPPED = "Already have an account?"
    static let LOGIN_LABEL_TAPPED = "Don't have an account yet?"
    static let REGISTER: String = "Register"
    static let LOGIN: String = "Login"
}