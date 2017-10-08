//
//  MainScene.swift
//  CombinedSpriteKitSceneKit
//
//  Created by Davis Allie on 21/05/2015.
//  Copyright (c) 2015 tutsplus. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

class MainScene: SCNScene {
    
    var cubeNode: SCNNode!
    var cameraNode: SCNNode!
    var lightNode: SCNNode!
    
    override init() {
        super.init()
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    //MARK: - KVO
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "paused" {
            isPaused = change![NSKeyValueChangeKey.newKey] as! Bool
        }
    }
}
