//
//  ViewController.swift
//  HackwichEleven
//
//  Created by Berdell Akootchook on 4/13/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let initialLocation = CLLocation(latitude: 21.356302499275664, longitude: -158.0562190033631)
    
    //declare region radius around our initialLocation
    
    let regionRadius: CLLocationDistance = 10000
    
   // UHWO Campus Lat/Long 21.356302499275664, -158.0562190033631
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    centerMapOnLocation(location: initialLocation)
        //add annotation in viewDidLoad
       
        let restaurantOne = restaurantAnnotation(title: "DaSpot", type: "UHWO Cafe", coordinate: CLLocationCoordinate2D(latitude: 21.356302499275664, longitude: -158.0562190033631))
        mapView.addAnnotation(restaurantOne)
        
    }
    
    func centerMapOnLocation(location: CLLocation)
    {
        
        
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated:true)
            
        }
    

}

