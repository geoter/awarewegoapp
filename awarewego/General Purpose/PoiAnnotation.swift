//
//  PoiAnnotation.swift
//  awarewego
//
//  Created by awarewego on 18/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit
import MapKit

class PoiAnnotation: NSObject, MKAnnotation {
    
    struct Poi{
        var title:String
        var subtitle:String
        var latitude:Double
        var longitude:Double
        var coordinate:CLLocationCoordinate2D{
            return CLLocationCoordinate2DMake(latitude,longitude)
        }
        var imageName:String?
    }
    
    let title: String?
    let _subtitle: String
    let _imagename: String?
    let coordinate: CLLocationCoordinate2D

    var subtitle: String? { //used by MKAnnotationView
        return _subtitle
    }

    var imageName: String?{ //used by MKAnnotationView
        _imagename ?? "map_pin_blue"
    }

    var markerTintColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) //if marker is used
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, imageName: String?) {
       self.title = title
       self._subtitle = subtitle
       self.coordinate = coordinate
       self._imagename = imageName
       super.init()
     }
    
    convenience init(poi:Poi) { self.init(title:poi.title,subtitle:poi.subtitle,coordinate:poi.coordinate,imageName:poi.imageName)
    }
}
