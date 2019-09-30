//
//  FilterCellViewModel.swift
//  awarewego
//
//  Created by awarewego on 30/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import Foundation


struct FilterCellViewModel: Hashable {
    
    let identifier = UUID()
    var text: String
    
    private let filter:FiltersDataModel.Filter
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: FilterCellViewModel, rhs: FilterCellViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(with filter:FiltersDataModel.Filter) {
        self.filter = filter
        switch self.filter.type {
            case .location(let place):
                self.text = place
            case .duration(let minutes):
                switch minutes {
                case 30:
                    self.text = "30'"
                default:
                    self.text = "\(minutes)"
                }
            case .price(let cost):
                self.text = "\(cost)"
            case .distanceCovered(let distance):
                switch distance {
                case 1:
                    self.text = "1km"
                default:
                    self.text = "\(distance)kms"
                }
        }
    }
}
