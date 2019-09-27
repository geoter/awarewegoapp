//
//  MissionsDataLayer.swift
//  awarewego
//
//  Created by awarewego on 27/09/2019.
//  Copyright © 2019 awarewego. All rights reserved.
//

import Foundation

class MissionsDataLayer{
    
    struct Mission {
        let identifier:String
        let title: String
        let description: String
        let price:Float
        let likes:Int
    }

    class func getMissions()-> [Mission] {
        let exampleMission = Mission(identifier: "0001", title: "Athena's Wrath", description: "Prometheus wants to steal the fire from Zeus to help the Humanity. Help Premotheus convince Athena to get him to Olympus Mountain", price: 5.00, likes: 2)
        return [exampleMission]
    }

}
