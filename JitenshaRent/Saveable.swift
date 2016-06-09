//
//  Saveable.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import Foundation

protocol Saveable: NSCoding {
    init?(coder aDecoder: NSCoder)
    func encodeWithCoder(aCoder: NSCoder)
}