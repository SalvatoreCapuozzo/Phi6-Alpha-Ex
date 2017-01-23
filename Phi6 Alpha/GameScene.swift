//
//  GameScene.swift
//  Phi6 Alpha
//
//  Created by Salvatore Capuozzo on 22/01/2017.
//  Copyright © 2017 Salvatore Capuozzo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var phisphere: SKSpriteNode!
    var triangle: SKSpriteNode!
    var block: SKSpriteNode!
    var numTriangle: Int = 0
    var arrayTriangle: Array<SKSpriteNode> = Array<Any>(repeating: SKSpriteNode(), count: 100) as! Array<SKSpriteNode>
    
    let triangleTexture = SKTexture(imageNamed: "Triangle")

    
    var pausePosition: CGPoint!
    var pauseDiameter: CGFloat!
    var pauseTriangleWidth: CGFloat!
    var pauseTriangleHeight: CGFloat!
    var pauseTrianglePos: CGPoint!
    var pauseBlockPos: CGPoint!
    var pause = true
    
    override func didMove(to view: SKView) {
        
        phisphere = childNode(withName: "phisphere") as! SKSpriteNode
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        pausePosition = phisphere.position
        pauseDiameter = phisphere.size.width
        
        triangle = childNode(withName: "triangle") as! SKSpriteNode
        pauseTriangleWidth = triangle.size.width
        pauseTriangleHeight = triangle.size.height
        pauseTrianglePos = triangle.position
        
        block = childNode(withName: "block") as! SKSpriteNode
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        pauseBlockPos = block.position
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                phisphere.position = touchLocation
                            } else if sprite == triangle {
                                triangle.position = touchLocation
                                
                                //triangle.size.height += 20
                                //triangle.position.y += 10
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == phisphere {
                                phisphere.position = touchLocation
                            } else if sprite == triangle {
                                triangle.position = touchLocation
                                //triangle.size.height += 20
                                //triangle.position.y += 10
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !pause {
            phisphere.physicsBody?.affectedByGravity = true
        }
    }
    
    func play() {
        self.pause = false
    }
    
    func stop() {
        self.pause = true
        reset()
    }
    
    func isStopped() -> Bool {
        if self.pause == true {
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        phisphere.physicsBody?.affectedByGravity = false
        phisphere.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        phisphere.physicsBody?.angularVelocity = 0
        phisphere.position = pausePosition
        phisphere.zRotation = 0
        phisphere.size.width = pauseDiameter
        phisphere.size.height = pauseDiameter
        triangle.size.width = pauseTriangleWidth
        triangle.size.height = pauseTriangleHeight
        triangle.position = pauseTrianglePos
        block.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        block.physicsBody?.angularVelocity = 0
        block.position = pauseBlockPos
        block.zRotation = 0
    }
    /*
    func addTriangle() {
        arrayTriangle[numTriangle] = SKSpriteNode(imageNamed: "Triangle.png")
        addChild(arrayTriangle[numTriangle]) as! SKSpriteNode
        
        arrayTriangle[numTriangle].size.width = 50
        arrayTriangle[numTriangle].size.height = 50
    }
*/
}
