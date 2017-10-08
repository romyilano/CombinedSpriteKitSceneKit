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
        
        let cube = SCNBox.init(width: 3, height: 3, length: 3, chamferRadius: 0)
        
        let materialScene = SKScene(size: CGSize(width: 100, height: 100))
        let backgroundNode = SKSpriteNode(color: .blue, size: materialScene.size.height/2.0)
        backgroundNode.position = CGPoint(x: materialScene.size.width/2.0, y: materialScene.size.height/2.0)
        materialScene.addChild(backgroundNode)
        
        let blueAction = SKAction.colorize(with: .blue, colorBlendFactor: 1, duration: 1)
        let redAction = SKAction.colorize(with: .red, colorBlendFactor: 1, duration: 1)
        let greenAction = SKAction.colorize(with: .green, colorBlendFactor: 1, duration: 1)
        backgroundNode.runAction(SKAction.repeatActionForever(SKAction.sequence[blueAction, redAction, greenAction]))
        
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents =

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
