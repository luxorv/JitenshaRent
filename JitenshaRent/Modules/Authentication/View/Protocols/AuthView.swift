//
//  AuthView.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/19/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import UIKit

protocol AuthView: class {
    var shouldChangeAuthenticationType: Bool { get set }
    
    func changeAuthenticationLabel()
    func performSegue()
}