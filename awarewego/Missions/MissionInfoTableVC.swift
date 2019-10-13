//
//  MissionInfoTableVC.swift
//  awarewego
//
//  Created by awarewego on 10/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class MissionInfoTableVC: UITableViewController {

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
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


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
