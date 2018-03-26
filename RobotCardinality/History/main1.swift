////
////  main.swift
////  RobotCardinality
////
////  Created by Wang Shilong on 1/28/18.
////  Copyright © 2018 Wang Shilong. All rights reserved.
////
//
//import Foundation
//
//let world = World()
//let food = world.foodLocation
//let channel = CardinalityChannel()
//
//let r1 = Robot(iD: "Robot 1", startLocation: (x: 44, y: 42))
//let r2 = Robot(iD: "Robot 2", startLocation: (x: 0, y: 0))
//
//
//print("|||||||||||| TEST START |||||||||||| \n")
//
//print("Food Location: \(food) \n")
//
//print("<TEST 1: r1 go to food location and become BEACON, then set food cardi value to 1> \n")
//var dist = CardinalityChannel.getDistance(from: r1.currentLocation, to: food)
//r1.becomeBeacon()
//r1.setFoodCardinality(minFoodValue: 0)
//
////save r1 's location to channel
//channel.saveCurrentLocation(id: "r1", currentLocation: r1.currentLocation)
//r1.printStatus()
//
//
//print("<TEST 2: r2 go looking for r1, and stop around r1 to become BEACON, then set food cardi value> \n")
//
//repeat {
//    r2.moveTopRight()
//    dist = CardinalityChannel.getDistance(from: r2.currentLocation, to: r1.currentLocation)
//
//    // save r2 's location to channel
//    channel.saveCurrentLocation(id: "r2", currentLocation: r2.currentLocation)
//    print(r2.currentLocation)
//
//} while (dist != CardinalityChannel.standDistance)
//
//print("Robot 2: 1 BEACON around me \n")
//r2.becomeBeacon()
//var minCardinality = r2.collectMinValue(robot: r1)
//r2.setFoodCardinality(minFoodValue: minCardinality.food)
//r2.printStatus()
//
//print("All Robot's Location:  \(CardinalityChannel.locations)")
//
////////////////////
//
//let prob = CardinalityChannel.randomPercent()
//switch(prob) {
//case 0.00..<30.00:
//    print(prob, "less than 30%")
//    print("Become WALKER")
//case 30.00...100.00:
//    print(prob, "more than 30%")
//default:
//    print(prob, "Something Wrong")
//}
//
