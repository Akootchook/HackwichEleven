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
    
    let regionRadius: CLLocationDistance = 50000
    
   // UHWO Campus Lat/Long 21.356302499275664, -158.0562190033631
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        
        // Do any additional setup after loading the view.
    centerMapOnLocation(location: initialLocation)
        //add annotation in viewDidLoad
       
        let restaurantOne = restaurantAnnotation(title: "DaSpot", type: "UHWO Cafe", coordinate: CLLocationCoordinate2D(latitude: 21.356302499275664, longitude: -158.0562190033631))
        mapView.addAnnotation(restaurantOne)
        
        let restaurantTwo = restaurantAnnotation(title: "Coquitos", type: "Cuban Food", coordinate: CLLocationCoordinate2D(latitude: 21.447662617712236, longitude: -158.1893764883707))
        mapView.addAnnotation(restaurantTwo)
        //21.447662617712236, -158.1893764883707 location of Coquitos restaurant in Waianae
     
        let bakeryOne = bakeryAnnotation(title: "UBAE", type: "Bakery Shop", coordinate: CLLocationCoordinate2D(latitude: 21.32168635371063, longitude: -157.87606350186684))
        mapView.addAnnotation(bakeryOne)
        //21.32168635371063, -157.87606350186684 UBAE food shop
        
     
        
    }
    
    func centerMapOnLocation(location: CLLocation)
    {
        
        
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated:true)
            
        }
    

}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let title = annotation.title, title == "UBAE" {
            annotationView?.image = UIImage(named: "ubae.shopify_540x")
        } else if let title = annotation.title, title == "DaSpot" {
            annotationView?.image = UIImage(named: "daspot")
        }
        else if let title = annotation.title, title == "Coquitos" {
           annotationView?.image = UIImage(named: "coquitos")
       }
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
