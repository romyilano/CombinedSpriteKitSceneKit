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
        let backgroundNode = SKSpriteNode(color: .blue, size: materialScene.size)
        backgroundNode.position = CGPoint(x: materialScene.size.width / 2.0, y: materialScene.size.height / 2.0)
        materialScene.addChild(backgroundNode)
        
        let blueAction = SKAction.colorize(with: .blue, colorBlendFactor: 1, duration: 1)
        let redAction = SKAction.colorize(with: .red, colorBlendFactor: 1, duration: 1)
        let greenAction = SKAction.colorize(with: .green, colorBlendFactor: 1, duration: 1)
        
        backgroundNode.run(SKAction.repeatForever(SKAction.sequence([blueAction, redAction, greenAction])))
        
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = materialScene
        cube.materials = [cubeMaterial]
        
        cubeNode = SCNNode(geometry: cube)
        cubeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0.01, z: 0, duration: 1.0/60.0)))
        
        let camera = SCNCamera()
        camera.xFov = 60
        camera.yFov = 60
        
        let ambientLight = SCNLight()
        ambientLight.type = SCNLight.LightType.ambient
        ambientLight.color = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        
        let cameraConstraint = SCNLookAtConstraint(target: self.cubeNode)
        cameraConstraint.isGimbalLockEnabled = true
        
        self.cameraNode = SCNNode()
        self.cameraNode.camera = camera
        self.cameraNode.constraints = [cameraConstraint]
        self.cameraNode.light = ambientLight
        self.cameraNode.position = SCNVector3(x: 5, y: 5, z: 5)
        
        let omniLight = SCNLight()
        omniLight.type = SCNLight.LightType.omni
        
        self.lightNode = SCNNode()
        self.lightNode.light = omniLight
        self.lightNode.position = SCNVector3(x: -3, y: 5, z: 3)
        
        self.rootNode.addChildNode(self.cubeNode)
        self.rootNode.addChildNode(self.cameraNode)
        self.rootNode.addChildNode(self.lightNode)

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
