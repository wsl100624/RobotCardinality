//
//  CardinalityChannel.swift
//  RobotCardinality
//
//  Created by Wang Shilong on 1/28/18.
//  Copyright © 2018 Wang Shilong. All rights reserved.
//

import Foundation

class CardinalityChannel {
    
    static var locations = Dictionary<String, (x: Int, y: Int)>()
    static var cardinalities = Dictionary<String, (nest: Int, food: Int)>()
    static let standDistance = 10.0
    static let foodDetectedDistance = 2.0
    
    
    
    static func getDistance(from currentLocation : (x: Int, y: Int), to targetLocation : (x: Int, y: Int)) -> Double {
        
        let result = sqrt(pow(Double(targetLocation.x - currentLocation.x), 2) + pow(Double(targetLocation.y - currentLocation.y), 2))
    
        return result
    }
    
    
    static func saveCurrentLocation(robot: Robot) {
        
        CardinalityChannel.locations.updateValue(robot.currentLocation, forKey: robot.ID)
    }
    
    static func saveCardinality(robot: Robot) {
        
        CardinalityChannel.cardinalities.updateValue(robot.cardinality, forKey: robot.ID)
    }
    
    
    static func randomPercent() -> Double {
        
        let time = UInt32(NSDate().timeIntervalSinceReferenceDate)
        srand48(Int(time))
        
        return drand48()*100
    }
    
    
    
    
}
