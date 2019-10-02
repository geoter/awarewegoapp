//
//  UIRecommendSearchController.swift
//  awarewego
//
//  Created by awarewego on 02/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class UIRecommendSearchController: UISearchController {

    private var recommendationVC:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let recommendVC = recommendationVC{
            recommendVC.view.alpha = 0
            add(child:recommendVC)
            searchBar.delegate = self
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
       if let recommendVC = recommendationVC{
            showRecommendationVC()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
      }
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }
    
    convenience init(searchResultsController: UIViewController?, recommendViewController:UIViewController) {
        self.init(searchResultsController: searchResultsController)
        recommendationVC = recommendViewController
    }
    
    private func showRecommendationVC(){
        recommendationVC!.view.isHidden = false
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.recommendationVC!.view.alpha = 1
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
                showRecommendationVC()
            }
            else{
                recommendVC.view.isHidden = true
                recommendVC.view.alpha = 0
            }
        }
    }
}
