//
//  MainScene.swift
//  CombinedSpriteKitSceneKit
//
//  Created by Davis Allie on 21/05/2015.
//  Copyright (c) 2015 tutsplus. All rights reserved.
//

import UIKit
import SceneKit

class MainScene: SCNScene {
    
    var cubeNode: SCNNode!
    var cameraNode: SCNNode!
    var lightNode: SCNNode!
    
    override init() {
        super.init()
        
        let cube = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0)
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = UIColor.blueColor()
        cube.materials = [cubeMaterial]
        self.cubeNode = SCNNode(geometry: cube)
        
        let camera = SCNCamera()
        camera.xFov = 60
        camera.yFov = 60
        
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        
        let cameraConstraint = SCNLookAtConstraint(target: self.cubeNode)
        cameraConstraint.gimbalLockEnabled = true
        
        self.cameraNode = SCNNode()
        self.cameraNode.camera = camera
        self.cameraNode.constraints = [cameraConstraint]
        self.cameraNode.light = ambientLight
        self.cameraNode.position = SCNVector3(x: 5, y: 5, z: 5)
        
        let omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        
        self.lightNode = SCNNode()
        self.lightNode.light = omniLight
        self.lightNode.position = SCNVector3(x: -3, y: 5, z: 3)
        
        self.rootNode.addChildNode(self.cubeNode)
        self.rootNode.addChildNode(self.cameraNode)
        self.rootNode.addChildNode(self.lightNode)
        
        let displayLink = CADisplayLink(target: self, selector: "rotateCube")
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func rotateCube() {
        let vector = self.cubeNode.eulerAngles
        self.cubeNode.eulerAngles = SCNVector3(x: vector.x, y: (vector.y + 0.01), z: vector.z)
    }
}