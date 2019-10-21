//
//  MissionInfoTableVC.swift
//  awarewego
//
//  Created by awarewego on 10/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit
import MapKit

protocol MissionInfoTableVCScrollDelegate {
    func scrollBegan(scrollView:UIScrollView)
    func scrollEnded(scrollView:UIScrollView)
}

class MissionInfoTableVC: UITableViewController {

    var scrollBehaviourDelegate:MissionInfoTableVCScrollDelegate?

    @IBOutlet weak var missionTitleLabel: UILabel!
    @IBOutlet weak var missionDescriptionLabel: UILabel!
    @IBOutlet weak var poisCollectionView: UICollectionView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.missionTitleLabel.text = "Athena's wrath and the magic feather of swifer skai tv show ad"
        self.missionDescriptionLabel.text = "there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it "
        
        mapView.register(PoiAnnotationView.self,
        forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        drawMapPoints()
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let parentVC = self.parent{
           if let conformingParent = parentVC as? MissionInfoTableVCScrollDelegate{
               self.scrollBehaviourDelegate = conformingParent
           }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ScrollTimer._timer?.invalidate()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let identifier = tableView.cellForRow(at: indexPath)?.reuseIdentifier{
            switch identifier {
            case "Map":
               let mapvc = MapVC(nibName: "MapVC", bundle: nil)
               self.present(mapvc, animated: true, completion: nil)
            default: break
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MissionInfoTableVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PoiCell", for: indexPath)
        let imgV = cell.viewWithTag(1) as! UIImageView
        let poiNameLabel = cell.viewWithTag(2) as! UILabel
        
        imgV.image = UIImage(named: "parthenon_poi")
        poiNameLabel.text = "The parthenon the parthenon"
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MissionInfoTableVC{
    
    struct ScrollTimer {
        fileprivate static var _timer:Timer? = nil {
            didSet{
                RunLoop.current.add(_timer!, forMode: .common)
                _timer?.tolerance = 0.1
            }
        }
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.scrollBehaviourDelegate?.scrollBegan(scrollView: scrollView)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setTimer()
    }
    
    func setTimer(){
        if let timer = ScrollTimer._timer{
            timer.invalidate()
        }
        ScrollTimer._timer = Timer.scheduledTimer(timeInterval:0.5,target:self ,
                  selector: #selector(scrollEndedTrigger),
                  userInfo: nil,
                  repeats: false)
    }
    
    @objc func scrollEndedTrigger() {
        self.scrollBehaviourDelegate?.scrollEnded(scrollView: self.tableView)
    }
}

extension MissionInfoTableVC:MKMapViewDelegate{
    
    struct MapPoint{
        var title:String
        var latitude:Double
        var longitude:Double
        var coordinate:CLLocationCoordinate2D{
            return CLLocationCoordinate2DMake(latitude,longitude)
        }
    }
    
     func drawMapPoints(){
           let poi1 = PoiAnnotation.Poi(title: "Thissio",subtitle:"5km away", latitude: 37.976713, longitude: 23.720646)
           let poi2 = PoiAnnotation.Poi(title: "Kerameikos",subtitle:"5km away", latitude: 37.978653, longitude: 23.711482)
           let poi3 = PoiAnnotation.Poi(title: "Benaki",subtitle:"5km away", latitude: 37.974840, longitude: 23.708397)
           
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
            renderer.fillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0.4875856164)
            //renderer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            //renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer()
    }
    
}
