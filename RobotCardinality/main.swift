//
//  main.swift
//  RobotCardinality
//
//  Created by Wang Shilong on 2/14/18.
//  Copyright © 2018 Wang Shilong. All rights reserved.
//

import Foundation



let world = World()

let r1 = Robot(iD: "R1", startLocation: world.nestLocation)
let r2 = Robot(iD: "R2", startLocation: (x: 3, y: 4))
let r3 = Robot(iD: "R2", startLocation: (x: 1, y: 2))
let r4 = Robot(iD: "R2", startLocation: (x: 4, y: 9))

//
//let r5 = Robot(iD: "R5", startLocation: (x: 27, y: 32))
//let r6 = Robot(iD: "R6", startLocation: (x: 24, y: 40))
//
//CardinalityChannel.saveCurrentLocation(robot: r5)
//CardinalityChannel.saveCurrentLocation(robot: r6)
//
//r5.cardinality = (nest: 0, food: 1)
//r6.cardinality = (nest: 0, food: 1)
//
//CardinalityChannel.saveCardinality(robot: r5)
//CardinalityChannel.saveCardinality(robot: r6)
//
let queue1 = DispatchQueue(label: "R1")
let queue2 = DispatchQueue(label: "R2")
let queue3 = DispatchQueue(label: "R3")
let queue4 = DispatchQueue(label: "R4")
//
queue1.async {
    r1.becomeBeacon()
}

queue2.async {
    r2.becomeBeacon()
}

queue3.async {
    r3.becomeBeacon()
}

queue4.async {
    r4.becomeBeacon()
}

r1.printStatus()
r2.printStatus()
r3.printStatus()
r4.printStatus()



//
//    DispatchQueue.global().async {
//        print("|||||||| All Robot's location |||||||||")
//        print(CardinalityChannel.locations)
//    }
//    DispatchQueue.global().async {
//        print("|||||||| All Robot's cardinalities |||||||||")
//        print(CardinalityChannel.cardinalities)
//    }
//}
//
//
//print("")






