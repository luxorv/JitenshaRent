//
//  RentPresenter.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/20/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation
import SwiftyJSON

class RentPresenter: RentViewPresenter {
    
    unowned let view: RentView
    let rentServiceProvider: RentServiceProvider
    let baseURLGeocode = "https://maps.googleapis.com/maps/api/geocode/json?"
    
    var userToken: String = ""
    var places = [RentPlace]()
    
    required init(view: RentView) {
        self.view = view
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let accessToken: String? = defaults.stringForKey(User.PropertyKey.accessTokenKey)
        
        self.userToken = accessToken!
        
        self.rentServiceProvider = RentServiceProvider(userToken: self.userToken)
        self.loadRentPlaces()
    }
    
    func loadRentPlaces() {
        rentServiceProvider.rentAction(
            .PLACES,
            successCallback: self.loadRentPlacesSuccess,
            failureCallback: self.loadRentPlacesFail
        )
    }
    
    func loadRentPlacesSuccess(responseJson: JSON) {
        let json = responseJson["results"]
        
        for (_, subJson):(String, JSON) in json {
            
            let rentPlace = RentPlace(
                name: subJson["name"].string!,
                id: subJson["id"].string!,
                latitude: subJson["location"]["lat"].double!,
                longitude: subJson["location"]["lng"].double!
            )!
            
            places += [rentPlace]
            
            self.view.displayMarker(rentPlace)
        }
    }
    
    func loadRentPlacesFail(error: NSError) {
        
        print("Error on Authentication! Error \(error.code)")
    }
}