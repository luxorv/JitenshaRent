//
//  ViewController.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/20/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import UIKit

class ViewController: UINavigationController {
    
    var authPresenter: AuthPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        if(AuthPresenter.loadUser()) {
            print("MapSegue")
            performSegueWithIdentifier("MapSegue", sender: self)
        } else {
            print("AuthSegue")
            performSegueWithIdentifier("AuthSegue", sender: self)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
