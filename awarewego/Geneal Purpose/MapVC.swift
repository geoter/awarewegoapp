//
//  MapVC.swift
//  awarewego
//
//  Created by awarewego on 18/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        drawMapPoints()
        // Do any additional setup after loading the view.
    }
}

extension MapVC:MKMapViewDelegate{
    
    struct MapPoint{
        var title:String
        var latitude:Double
        var longitude:Double
        var coordinate:CLLocationCoordinate2D{
            return CLLocationCoordinate2DMake(latitude,longitude)
        }
    }
    
    func drawMapPoints(){
        let poi1 = MapPoint(title: "Thissio", latitude: 37.976713, longitude: 23.720646)
        let poi2 = MapPoint(title: "Kerameikos", latitude: 37.978653, longitude: 23.711482)
        let poi3 = MapPoint(title: "Benaki", latitude: 37.974840, longitude: 23.708397)
        
        addMapPoint(poi: poi1)
        addMapPoint(poi: poi2)
        addMapPoint(poi: poi3)
        
        mapView.fitAll()
        
        var locations = [poi1,poi2,poi3].map { $0.coordinate }
        let polygon = MKPolygon(coordinates: &locations, count: locations.count)
        mapView?.addOverlay(polygon)
    }
    
    func addMapPoint(poi:MapPoint){
        let pin = MKPointAnnotation()
        pin.title = poi.title
        pin.coordinate = CLLocationCoordinate2D(latitude: poi.latitude, longitude: poi.longitude)
        mapView.addAnnotation(pin)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else { return nil }
//
//        let identifier = "Annotation"
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = false
//        } else {
//            annotationView!.annotation = annotation
//        }
//
//        return annotationView
//    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            renderer.fillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.8225866866)
            //renderer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            //renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer()
    }
    
}
