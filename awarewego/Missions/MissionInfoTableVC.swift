//
//  MissionInfoTableVC.swift
//  awarewego
//
//  Created by awarewego on 10/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

protocol MissionInfoTableVCScrollDelegate {
    func scrollBegan(scrollView:UIScrollView)
    func scrollEnded(scrollView:UIScrollView)
}

class MissionInfoTableVC: UITableViewController {

    var scrollBehaviourDelegate:MissionInfoTableVCScrollDelegate?
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var missionTitleLabel: UILabel!
    @IBOutlet weak var missionDescriptionLabel: UILabel!
    @IBOutlet weak var poisCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.missionTitleLabel.text = "Athena's wrath and the magic feather of swifer skai tv show ad"
        self.missionDescriptionLabel.text = "there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it there is a very good reason to do it "
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

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
        fileprivate static var counter = 0{
            didSet{
                print("\(counter)")
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
        ScrollTimer.counter = ScrollTimer.counter + 1
        
    }
    
    @objc func scrollEndedTrigger() {
        self.scrollBehaviourDelegate?.scrollEnded(scrollView: self.tableView)
    }
}
