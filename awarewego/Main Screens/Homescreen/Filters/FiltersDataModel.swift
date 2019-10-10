//
//  FiltersDataModel.swift
//  awarewego
//
//  Created by awarewego on 30/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import Foundation

class FiltersDataModel {
    class func getFilters() -> [Filter] {
        return [Filter(type: .duration(minutes: 30)),
        Filter(type: .location(place: "Athens")),
        Filter(type: .price(cost: .free))]
    }
    
    enum FilterType{
        case location(place:String)
        case duration(minutes:Int)
        case price(cost:Price)
        case distanceCovered(distance:Int)
    }
    
    enum Price:String{
        case paid
        case free
    }

    struct Filter {
        var type:FilterType
    }
}

