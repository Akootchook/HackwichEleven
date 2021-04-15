//
//  bakeryAnnotation.swift
//  HackwichEleven
//
//  Created by Berdell Akootchook on 4/15/21.
//

import UIKit
import MapKit


class bakeryAnnotation: NSObject, MKAnnotation {

    let bakeryTitle: String?
    let bakeryType: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, type: String, coordinate: CLLocationCoordinate2D)
    {
        self.bakeryTitle = title
        self.bakeryType = type
        self.coordinate = coordinate
        
        super.init()
        
    }
    var subtitle: String?{
    return bakeryTitle
    
    
    
    
}
}
