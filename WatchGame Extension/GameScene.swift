//
//  GameScene.swift
//  WatchGame Extension
//
//  Created by Daniil Popov on 6/13/19.
//  Copyright © 2019 Daniil Popov. All rights reserved.
//

import SpriteKit
import WatchKit

class GameScene: SKScene {
    
    private var spinnyNode : SKShapeNode?
    
    var label:SKLabelNode = SKLabelNode()
    
    override func sceneDidLoad() {
        for node in self.children {
            if (node.name == "helloLabel") {
                if let someLabel:SKLabelNode = node as? SKLabelNode {
                    label = someLabel
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func didSwipe(swipeGesture:WKSwipeGestureRecognizer) {
        
        // move helloWorld node by X
        if ( swipeGesture.direction == .right ) {
            moveSomeNodeBy(who: label, amountX: 50, amountY: 0)
            print("GameScene swiped right")
        } else if ( swipeGesture.direction == .left ) {
            moveSomeNodeBy(who: label, amountX: -50, amountY: 0)
            print("GameScene swiped left")
        }
        
    }
    
    func didRotateCrown(step: CGFloat) {
        // move helloWorld node by Y
        moveSomeNodeBy(who: label, amountX: 0, amountY: step)
    }
    
    func moveSomeNodeBy(who:SKNode, amountX:CGFloat, amountY:CGFloat) {
        
        let move:SKAction = SKAction.moveBy(x: amountX, y: amountY, duration: 1)
        move.timingMode   = .easeOut
        
        who.run (move)
    }
    
}
