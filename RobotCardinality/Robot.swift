//
//  Robot.swift
//  RobotCardinality
//
//  Created by Wang Shilong on 1/28/18.
//  Copyright © 2018 Wang Shilong. All rights reserved.
//

import Foundation

class Robot {
    
    var ID : String
    var currentLocation : (x: Int, y: Int)
    var cardinality = (nest: 0, food: 0)
    var beacon = false
    let cardinalityChannel = CardinalityChannel()
    
    
    init(iD: String, startLocation : (x: Int, y: Int)) {
        ID = iD
        currentLocation = startLocation
    }
    
    func moveForward() {
        currentLocation.y += 1
    }
    
    func moveBackward() {
        currentLocation.y -= 1
        
    }
    
    func moveLeft() {
        currentLocation.x -= 1
    }
    
    func moveRight() {
        currentLocation.x += 1
    }
    
    func moveTopRight() {
        moveForward()
        moveRight()
        
    }
    
    func moveTopLeft() {
        moveForward()
        moveLeft()

    }
    
    func moveBottomRight() {
        moveBackward()
        moveRight()
    }
    
    func moveBottomLeft() {
        moveBackward()
        moveLeft()
    }
    
    func becomeWalker() {
        beacon = false
    }
    
    func becomeBeacon() {
        
        beacon = true
        CardinalityChannel.saveCurrentLocation(robot: self)
        
        if hearBeacon() >= 3 {
            print("Detected 3 or more beacons")
            if CardinalityChannel.randomPercent() < 30.00 {
                print("Prob < 30%, \(ID) has became WALKER")
                becomeWalker()
            } else {
                print("Prob > 30%, stay as BEACON")
            }
        } else {
            setFoodCardinality(minFoodValue: collectMinValue().food)
            CardinalityChannel.saveCardinality(robot: self)
        }
    }
    
    
    func hearBeacon() -> Int {
        
        var heardBeacon = 0
        
        for key in CardinalityChannel.locations.keys {
            let distance = CardinalityChannel.getDistance(from: self.currentLocation, to: CardinalityChannel.locations[key]!)
            if distance <= CardinalityChannel.standDistance {
                if distance != 0 {
                    print("I have heard \(key)")
                    heardBeacon += 1
                }
            }
        }
        print("Totally heard \(heardBeacon) beacons")
        return heardBeacon
    }
    
    
    func collectMinValue() -> (nest: Int, food: Int) {
        
        var minDistance = 10.0
        var minValue = (nest: 0, food: 0)
        
        for key in CardinalityChannel.locations.keys {
            let distance = CardinalityChannel.getDistance(from: self.currentLocation, to: CardinalityChannel.locations[key]!)
            if distance != 0 {
                if distance <= minDistance {
                   minDistance = distance
                    minValue = (CardinalityChannel.cardinalities[key])!
                }
            }
        }
        return minValue
    }
    
    func setFoodCardinality(minFoodValue: Int) {
        
        cardinality.food = minFoodValue + 1
    }
    
    func nestSearch() {
        print("Getting back to nest! \n")
    }
    
    func foodSearch() {
        print("Looking for food \n")
        
    }
    
    func printStatus() {
        print("|||||||| \(ID) Status |||||||||")
        
        if beacon {
            print("BEACON")
        } else {
            print("WALKER")
        }
        
        print("My location: \(currentLocation)")
        print("My cardinality value: (nest) \(cardinality.nest), (food) \(cardinality.food) \n")
    }
    
    
    
    
    
    
}
