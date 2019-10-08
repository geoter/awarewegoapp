//
//  FiltersViewController.swift
//  awarewego
//
//  Created by awarewego on 03/10/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
   
    @IBOutlet weak var durationSlider: RangeSeekSlider!
    @IBOutlet weak var distanceSlider: RangeSeekSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationSlider.delegate = self
        distanceSlider.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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

extension FiltersViewController:RangeSeekSliderDelegate{
    func didStartTouches(in slider: RangeSeekSlider){
        print("disable")
        self.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
    }
    
    func didEndTouches(in slider: RangeSeekSlider){
        print("enable")
        self.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = true
    }
}

