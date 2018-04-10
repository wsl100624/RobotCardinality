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
    var nearbyRobot = [String]()
    var nearbyRobotWithDistance = Dictionary<String, Double>()
    let cardinalityChannel = CardinalityChannel()
    
    let foodLocation = World().foodLocation
    
    
    
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
        repeat {
            let randomNum = CardinalityChannel.randomPercent()
            switch randomNum {
            case 1..<25.00:
                moveTopLeft()
                if isOutOfBound() {
                    moveBottomRight()
                    print("Out of Bound!")
                    continue
                }
            case 25.00..<50.00:
                moveBottomLeft()
                if isOutOfBound() {
                    moveTopRight()
                    print("Out of Bound!")
                    continue
                }
            case 50.00..<75.00:
                moveTopRight()
                if isOutOfBound() {
                    moveBottomLeft()
                    print("Out of Bound!")
                    continue
                }
            default:
                moveBottomRight()
                if isOutOfBound() {
                    moveTopLeft()
                    print("Out of Bound!")
                    continue
                }
            }
            
            print(currentLocation)
            
            for location in foodLocation {
                if location == currentLocation {
                    print("Food Location: \(location)")
                    print("\(ID) found the FOOD! Becoming BEACON!")
                    beacon = true
                }
            }
        
        } while !beacon
        
        becomeBeacon()
    }
    
    func becomeBeacon() {
        print("|||||||| \(ID) Status |||||||||")
        beacon = true
        CardinalityChannel.saveCurrentLocation(robot: self)
        let beaconHeard = hearBeacon()
        
        if beaconHeard >= 3 {
            print("Detected 3 or more beacons")
            if CardinalityChannel.randomPercent() < 30.00 {
                print("Prob < 30%, \(ID) has became WALKER")
                becomeWalker()
            } else {
                print("Prob > 30%, stay as BEACON")
            }
        } else if beaconHeard > 1 {
            setFoodCardinality(minFoodValue: collectMinValue().food)
            
            
        } else if beaconHeard == 1 {
            let key = nearbyRobot[0]
            setFoodCardinality(minFoodValue: CardinalityChannel.cardinalities[key]!.food)
        } else {
           print("No beacon around me")
        }
        
        CardinalityChannel.saveCardinality(robot: self)
    }
    
    
    func hearBeacon() -> Int {
        
        var heardBeacon = 0
        
        for key in CardinalityChannel.locations.keys {
            let distance = CardinalityChannel.getDistance(from: self.currentLocation, to: CardinalityChannel.locations[key]!)
            if distance <= CardinalityChannel.standDistance {
                if distance != 0 {
                    print("\(ID) have heard \(key)")
                    nearbyRobot.append(key)
                    nearbyRobotWithDistance.updateValue(distance, forKey: key)
                    heardBeacon += 1
                }
            }
        }
        print("\(ID) Totally heard \(heardBeacon) beacons")
        return heardBeacon
    }
    
    
    func collectMinValue() -> (nest: Int, food: Int) {
        
        let nearestRobot = nearbyRobotWithDistance.min {a, b in a.value < b.value}
        return CardinalityChannel.cardinalities[nearestRobot!.key]!
        
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
    
    func isOutOfBound() -> Bool {
        
        let X = World().width
        let Y = World().length
        
        if currentLocation.x > X || currentLocation.x < 0 {
            return true
        } else if currentLocation.y > Y || currentLocation.y < 0 {
            return true
        } else {
            return false
        }
    }
    
    func printStatus() {
        
        if beacon {
            print("Has became BEACON")
        } else {
            print("Has became WALKER")
        }
        
        print("My location: \(currentLocation)")
        print("My cardinality value: (nest) \(cardinality.nest), (food) \(cardinality.food) \n")
    }
    
    
    
    
    
    
}
