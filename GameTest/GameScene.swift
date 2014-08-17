//
//  GameScene.swift
//  GameTest
//
//  Created by Aaron Meurer on 8/16/14.
//  Copyright (c) 2014 Aaron Meurer. All rights reserved.
//


import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

        for s in [sprite1, sprite2, sprite3, sprite4] {
            s.position = center
            var physics_body = SKPhysicsBody(rectangleOfSize: sprite_size)

            physics_body.affectedByGravity = false
            physics_body.allowsRotation = false


            s.physicsBody = physics_body
            self.addChild(s)
        }

    }

    // TODO: How can I use this variable in the definitions below?
    let sprite_size = CGSize(width: 30, height: 30)

    let sprite1 = SKSpriteNode(color: UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), size: CGSize(width: 30, height: 30))
    let sprite2 = SKSpriteNode(color: UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), size: CGSize(width: 30, height: 30))
    let sprite3 = SKSpriteNode(color: UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), size: CGSize(width: 30, height: 30))
    let sprite4 = SKSpriteNode(color: UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), size: CGSize(width: 30, height: 30))

    var selected: [UITouch: SKNode] = [:]

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */

        selected = [:]
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)

            selected[touch as UITouch] = nodeAtPoint(location)

        }
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            selected[touch as UITouch] = nil

        }
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        for (touch, node) in selected {
            if !contains([sprite1, sprite2, sprite3, sprite4], node) {
                continue
            }
            let location = touch.locationInNode(self)
            // We could also just set the node's position, like'
            // node.position = location
            // but this way seems better, and it also lets us add a delay by
            // upping the duration if we want
            let action = SKAction.moveTo(location, duration: 0.1)
            node.runAction(SKAction.repeatAction(action, count: 1))
        }
    }
}
