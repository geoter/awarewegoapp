//
//  SearchRecommendationsVC.swift
//  awarewego
//
//  Created by awarewego on 02/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

protocol SearchRecommendationsDelegate {
    func recommendationSelected(with selection:Any)
}

class SearchRecommendationsVC: UIViewController {

    public var delegate:SearchRecommendationsDelegate?
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    var recommendedTags:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recommendedTags.append(contentsOf: ["Nearby","Athens","Greece","Santorini","Parthenon"])
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

extension SearchRecommendationsVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let delegateClass = self.delegate {
            delegateClass.recommendationSelected(with: recommendedTags[indexPath.item])
        }
        
    }
}

extension SearchRecommendationsVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath)
        let label:UILabel = cell.viewWithTag(22) as! UILabel
        label.text = recommendedTags[indexPath.item]
        
        let roundView:UIView = cell.viewWithTag(33)!
        roundView.layer.cornerRadius = 16
        return cell
    }
    
    
}
