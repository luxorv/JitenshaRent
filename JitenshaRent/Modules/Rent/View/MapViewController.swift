//
//  JRMapViewController.swift
//  JitenshaRent
//
//  Created by Victor Ml Polanco on 5/18/16.
//  Copyright © 2016 Victor Ml Polanco. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate, RentView {
    
    // MARK: Properties
    
    var rentPresenter: RentViewPresenter!
    var first: Bool = true
    
    @IBOutlet weak var mapView: GMSMapView!
    
    // MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rentPresenter = RentPresenter(view: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: GMSMapViewDelegate
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        let myFirstButton = UIButton()
        myFirstButton.setTitle("✸", forState: .Normal)
        myFirstButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myFirstButton.frame = CGRectMake(15, -50, 300, 500)
        myFirstButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(myFirstButton)
        return true
    }
    
    // MARK: Class Functions// MARK: Class Functions
    
    func displayMarker(rentPlace: RentPlace) {
        
        if first {
            let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(rentPlace.location.lat, longitude: rentPlace.location.lng, zoom: 11)
            mapView.camera = camera
            
            first = false
        }
        
        let newLocation2D = CLLocationCoordinate2DMake(rentPlace.location.lat, rentPlace.location.lng)
        let marker = GMSMarker(position: newLocation2D)
        marker.icon = GMSMarker.markerImageWithColor(UIColor.cyanColor())
        marker.map = self.mapView
    }
    
    // MARK: Actions
    
    
}

