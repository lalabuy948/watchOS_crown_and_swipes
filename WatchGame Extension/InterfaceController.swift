//
//  InterfaceController.swift
//  WatchGame Extension
//
//  Created by Daniil Popov on 6/13/19.
//  Copyright © 2019 Daniil Popov. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, WKCrownDelegate {
    
    var gameScene:GameScene!

    @IBOutlet var skInterface: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        crownSequencer.delegate = self
        crownSequencer.focus()
        
        // Configure interface objects here.
        
        // Load the SKScene from 'GameScene.sks'
        if let scene = GameScene(fileNamed: "GameScene") {

            gameScene = scene
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill

            // Present the scene
            self.skInterface.presentScene(scene)
            
            // Use a value that will maintain a consistent frame rate
            self.skInterface.preferredFramesPerSecond = 30
        }
    }
    
    @IBAction func handleSwipeRight(swipeGesture: WKSwipeGestureRecognizer) {
        
        // log whats happened
        print("Swiped right")
        
        WKInterfaceDevice.current().play(.click)
        
        gameScene.didSwipe(swipeGesture: swipeGesture)
    }
    
    @IBAction func handleSwipeLeft(swipeGesture: WKSwipeGestureRecognizer) {
        
        // log whats happened
        print("Swiped left")
        
        WKInterfaceDevice.current().play(.click)
        
        gameScene.didSwipe(swipeGesture: swipeGesture)
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        // log whats happened
        print("Crown: \(rotationalDelta)")

        // convert crown rotation to CGFloat
        let step   = NSNumber.init(value: rotationalDelta * 20.0).floatValue
        let cgStep = CGFloat(step)

        gameScene.didRotateCrown(step: cgStep)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
