//
//  PoiAnnotationView.swift
//  awarewego
//
//  Created by awarewego on 18/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit
import MapKit

class PoiAnnotationMarkerView: MKMarkerAnnotationView {

   override var annotation: MKAnnotation? {
        willSet {
          guard let poi = newValue as? PoiAnnotation else { return }
          canShowCallout = true
          calloutOffset = CGPoint(x: -5, y: 5)
          rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

          markerTintColor = poi.markerTintColor
    //      glyphText = String(artwork.discipline.first!)
            if let imageName = poi.imageName {
              glyphImage = UIImage(named: imageName)
            } else {
              glyphImage = nil
          }
        }
      }

}

class PoiAnnotationView: MKAnnotationView {

  override var annotation: MKAnnotation? {
    willSet {
      guard let artwork = newValue as? PoiAnnotation else {return}

      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
        
        self.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
//      let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
//        size: CGSize(width: 30, height: 30)))
//        mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControl.State())
//      rightCalloutAccessoryView = mapsButton
//      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      if let imageName = artwork.imageName {
        image = UIImage(named: imageName)
      } else {
        image = nil
      }

      let detailLabel = UILabel()
      detailLabel.numberOfLines = 0
      detailLabel.font = detailLabel.font.withSize(12)
      detailLabel.text = artwork.subtitle
      detailCalloutAccessoryView = detailLabel
    }
  }

}
