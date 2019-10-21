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
        
        mapView.register(PoiAnnotationMarkerView.self,
        forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        drawMapPoints()
        // Do any additional setup after loading the view.
    }
}

extension MapVC:MKMapViewDelegate{
    
    func drawMapPoints(){
        
        //FIXME: Remove parthenon pin
        
        let poi1 = PoiAnnotation.Poi(title: "Thissio",subtitle:"Temple", latitude: 37.976713, longitude: 23.720646, imageName: "map-parthenon")
        let poi2 = PoiAnnotation.Poi(title: "Kerameikos",subtitle:"Market", latitude: 37.978653, longitude: 23.711482, imageName: "temple_map")
        let poi3 = PoiAnnotation.Poi(title: "Benaki",subtitle:"Museum", latitude: 37.974840, longitude: 23.708397)
        
        let annotations = [poi1,poi2,poi3].map { PoiAnnotation(poi:$0) }
        
        addMapPoints(annotations:annotations)
        
        mapView.fitAll()
        
        var locations = [poi1,poi2,poi3].map { $0.coordinate }
        let polygon = MKPolygon(coordinates: &locations, count: locations.count)
        mapView?.addOverlay(polygon)
    }
    
    func addMapPoints(annotations:[PoiAnnotation]){
        mapView.addAnnotations(annotations)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            renderer.fillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.4875856164)
            //renderer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            //renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer()
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else { return nil }
//
//        let identifier = NSStringFromClass(PoiAnnotation.self)
//        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
//
//        if let markerAnnotationView = view as? MKMarkerAnnotationView {
//            markerAnnotationView.animatesWhenAdded = true
//            markerAnnotationView.canShowCallout = true
//            markerAnnotationView.markerTintColor = UIColor(named: "internationalOrange")
//
//            /*
//             Add a detail disclosure button to the callout, which will open a new view controller or a popover.
//             When the detail disclosure button is tapped, use mapView(_:annotationView:calloutAccessoryControlTapped:)
//             to determine which annotation was tapped.
//             If you need to handle additional UIControl events, such as `.touchUpOutside`, you can call
//             `addTarget(_:action:for:)` on the button to add those events.
//             */
//            let rightButton = UIButton(type: .detailDisclosure)
//            markerAnnotationView.rightCalloutAccessoryView = rightButton
//        }
//
//        return view
//    }
       
       /// Called whent he user taps the disclosure button in the bridge callout.
      func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
              
          if let detailNavController = storyboard?.instantiateViewController(withIdentifier: "DetailNavController") {
              detailNavController.modalPresentationStyle = .popover
              let presentationController = detailNavController.popoverPresentationController
              presentationController?.permittedArrowDirections = .any
              
              // Anchor the popover to the button that triggered the popover.
              presentationController?.sourceRect = control.frame
              presentationController?.sourceView = control
              
              present(detailNavController, animated: true, completion: nil)
          }
      }
          
}
