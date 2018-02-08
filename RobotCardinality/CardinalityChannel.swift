//
//  CardinalityChannel.swift
//  RobotCardinality
//
//  Created by Wang Shilong on 1/28/18.
//  Copyright © 2018 Wang Shilong. All rights reserved.
//

import Foundation

class CardinalityChannel {
    
    var locations = Dictionary<String, (x: Int, y: Int)>()

    let standDistance = 10.0
    
    func getDistance(from currentLocation : (x: Int, y: Int), to targetLocation : (x: Int, y: Int)) -> Double {
        
        let result = sqrt(pow(Double(targetLocation.x - currentLocation.x), 2) + pow(Double(targetLocation.y - currentLocation.y), 2))
        
        return result
    }
    
    func saveCurrentLocation(id: String, currentLocation: (x: Int, y: Int)) {
        
        locations.updateValue(currentLocation, forKey: id)
        
    }
    
    
    
    
}
