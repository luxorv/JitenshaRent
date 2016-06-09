//
//  RentPlace.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/20/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation

class RentPlace: NSObject {
    
    // MARK: Properties
    
    struct Location {
        var lat: Double = 0.0
        var lng: Double = 0.0
    }
    
    var id: String = ""
    var name: String = ""
    var location: Location = Location(lat: 0.0, lng: 0.0)
    
    // MARK: Initialization
    
    override init() {
        super.init()
    }
    
    init?(name: String, id: String, latitude: Double, longitude: Double) {
        super.init()
        
        self.id = id
        self.name = name
        self.location = Location(lat: latitude, lng: longitude)
    }
}