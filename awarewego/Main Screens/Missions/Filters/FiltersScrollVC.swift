//
//  FiltersScrollVC.swift
//  awarewego
//
//  Created by awarewego on 03/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class FiltersScrollVC: UIViewController {

    var filterTags:[String] = []
    
    @IBOutlet weak var collectionV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        filterTags.append(contentsOf: ["Filters","Nearby","<3km","Free"])
        self.collectionV.reloadData()
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

extension FiltersScrollVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        if let delegateClass = self.delegate {
//            delegateClass.recommendationSelected(with: recommendedTags[indexPath.item])
//        }
        
    }
}

extension FiltersScrollVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath)
        let label:UILabel = cell.viewWithTag(22) as! UILabel
        label.text = filterTags[indexPath.item]
        
        let roundView:UIView = cell.viewWithTag(33)!
        roundView.layer.cornerRadius = 16
        return cell
    }
    
    
}
