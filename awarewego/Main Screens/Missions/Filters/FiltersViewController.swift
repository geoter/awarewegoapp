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
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMinValue minValue: CGFloat) -> String?{
        switch minValue {
        case 0...2:
            return "30'"
        default:
            return "0"
        }
    }

     /// Called when the RangeSeekSlider values are changed. A return `String?` Value is displayed on the `maxLabel`.
     ///
     /// - Parameters:
     ///   - slider: RangeSeekSlider
     ///   - maxValue: maximum value
     /// - Returns: String to be replaced
    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMaxValue: CGFloat) -> String?{
        switch stringForMaxValue {
             case 70...90:
                 return "1 hour"
             default:
                 return "all"
             }
    }
}

