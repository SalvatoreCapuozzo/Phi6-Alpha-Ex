//
//  Object.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Object {
    var width: CGFloat
    var height: CGFloat
    var position: CGPoint
    var node: SKSpriteNode
    
    init(width: CGFloat, height: CGFloat) {
        self.node = SKSpriteNode(imageNamed: "Triangle.png")
        self.width = node.size.width
        self.height = node.size.height
        self.position = CGPoint(x: 20, y: 20)
    }
}
