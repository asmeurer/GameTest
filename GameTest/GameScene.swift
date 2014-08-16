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
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//
//        self.addChild(myLabel)
		for s in [sprite, sprite2] {
        s.xScale = 3
        s.yScale = 3
        s.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
}
        self.addChild(sprite)

    }

    let sprite = SKSpriteNode(color: UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), size: CGSize(width: 10, height: 10))
    let sprite2 = SKSpriteNode(color: UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), size: CGSize(width: 10, height: 10))

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */


        for touch: AnyObject in touches {
			let location = touch.locationInNode(self)

			let action = SKAction.moveTo(location, duration: 1)
            sprite.runAction(SKAction.repeatAction(action, count: 1))

        }
    }

    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {

        for touch: ANyObject in touches {
			let location = touch.locationInNode(self)

			let action = SKAction.moveTo(location)

		}
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
