//
//  UIRecommendSearchController.swift
//  awarewego
//
//  Created by awarewego on 02/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class UIRecommendSearchController: UISearchController {

    private var recommendationVC:SearchRecommendationsVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let recommendVC = recommendationVC{
            add(child:recommendVC)
            recommendVC.view.alpha = 0
            searchBar.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let recommendVC = recommendationVC{
          showRecommendationVC(animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let recommendVC = recommendationVC{
            hideRecommendationVC(animated: true)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
      }
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }
    
    convenience init(searchResultsController: UIViewController?, recommendViewController:SearchRecommendationsVC) {
        self.init(searchResultsController: searchResultsController)
        recommendationVC = recommendViewController
        recommendationVC?.delegate = self
    }
    
    private func showRecommendationVC(animated enabled:Bool){
        recommendationVC!.view.isHidden = false
        UIView.animate(withDuration: enabled ? 0.2:0.0) {
            self.recommendationVC!.view.alpha = 1
        }
    }
    
    private func hideRecommendationVC(animated enabled:Bool){
        UIView.animate(withDuration: enabled ? 0.2:0.0, animations: {
            self.recommendationVC!.view.alpha = 0
        }) { (completed) in
            self.recommendationVC!.view.isHidden = true
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

extension UIRecommendSearchController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let recommendVC = recommendationVC{
            if searchText.count == 0 {
                showRecommendationVC(animated: false)
            }
            else{
                hideRecommendationVC(animated: false)
            }
        }
    }
}

extension UIRecommendSearchController: SearchRecommendationsDelegate{
    func recommendationSelected(with selection: Any) {
        print("selected \(selection)")
    }
}
