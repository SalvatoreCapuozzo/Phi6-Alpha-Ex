//
//  SimpleObject.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SimpleObject : Object {
    var mass: CGFloat
    var friction: CGFloat
    var physicsBody: SKPhysicsBody
    
    init(width: CGFloat, height: CGFloat, mass: CGFloat, friction: CGFloat) {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 0, y: 0, width: width, height: height))
        self.mass = physicsBody.mass
        self.friction = physicsBody.friction
        super.init(width: width, height: height)
    }
}
