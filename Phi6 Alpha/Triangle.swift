//
//  Triangle.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Triangle : SimpleObject {
    var alpha: CGFloat
    var beta: CGFloat
    var gamma: CGFloat
    
    override init(width: CGFloat, height: CGFloat, mass: CGFloat, friction: CGFloat) {
        self.alpha = 60
        self.beta = 60
        self.gamma = 60
        super.init(width: width, height: height, mass: mass, friction: friction)
    }
    
    func setTriangle(width: CGFloat, height: CGFloat) {
        self.node = SKSpriteNode(imageNamed: "Triangle.png")
        self.width = width
        self.height = height
        self.node.size.width = width
        self.node.size.height = height
    }
}
