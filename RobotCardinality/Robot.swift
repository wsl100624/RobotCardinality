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
    }
    
    func collectMinValue(robot: Robot) -> (nest: Int, food: Int) {
        
        let cardinality = (robot.cardinality.nest, robot.cardinality.food)
        
        return cardinality
        
    }
    
    func setFoodCardinality(minFoodValue: Int) {
        
        cardinality.food = minFoodValue + 1
    }
    
    func setNestCardinality(minNestValue: Int) {
        
        cardinality.nest = minNestValue + 1
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
