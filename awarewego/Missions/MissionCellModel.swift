//
//  MissionCellModel.swift
//  awarewego
//
//  Created by awarewego on 27/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import Foundation

struct MissionCellModel: Hashable {
    
    let identifier = UUID()
    let title: String
    let description: String
    let price:Float
    let likes:Int
    
    private let mission:MissionsDataLayer.Mission
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: MissionCellModel, rhs: MissionCellModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(with mission:MissionsDataLayer.Mission) {
        self.mission = mission
        self.title = mission.title
        self.description = mission.description
        self.price = mission.price
        self.likes = mission.likes
    }
}
