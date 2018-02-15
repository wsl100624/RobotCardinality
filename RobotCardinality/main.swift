//
//  main.swift
//  RobotCardinality
//
//  Created by Wang Shilong on 2/14/18.
//  Copyright © 2018 Wang Shilong. All rights reserved.
//

import Foundation

let world = World()

let r1 = Robot(iD: "R1", startLocation: (x: 6, y: 8))
let r2 = Robot(iD: "R2", startLocation: (x: 12, y: 16))
let r3 = Robot(iD: "R3", startLocation: (x: 18, y: 24))
let r4 = Robot(iD: "R4", startLocation: (x: 24, y: 32))

let r5 = Robot(iD: "R5", startLocation: (x: 27, y: 32))
let r6 = Robot(iD: "R6", startLocation: (x: 24, y: 40))

CardinalityChannel.saveCurrentLocation(robot: r5)
CardinalityChannel.saveCurrentLocation(robot: r6)

r5.cardinality = (nest: 0, food: 1)
r6.cardinality = (nest: 0, food: 1)

CardinalityChannel.saveCardinality(robot: r5)
CardinalityChannel.saveCardinality(robot: r6)




r3.becomeBeacon()
r3.printStatus()

r2.becomeBeacon()
r2.printStatus()

r1.becomeBeacon()
r1.printStatus()

r4.becomeBeacon()
r4.printStatus()

print(CardinalityChannel.locations)
print(CardinalityChannel.cardinalities)



