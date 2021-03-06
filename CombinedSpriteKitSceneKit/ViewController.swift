//
//  ViewController.swift
//  CombinedSpriteKitSceneKit
//
//  Created by Davis Allie on 21/05/2015.
//  Copyright (c) 2015 tutsplus. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @objc var sceneView: SCNView!
    @objc var spriteScene: OverlayScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.sceneView.scene = MainScene()
        spriteScene = OverlayScene(size: view.bounds.size)
        sceneView.overlaySKScene = spriteScene
        self.view.addSubview(self.sceneView)
        
        spriteScene.addObserver(sceneView.scene!, forKeyPath: "paused", options: .new, context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: sceneView) {
            let hitResults = sceneView.hitTest(location, options: nil)
            
            hitResults.forEach {
                if $0.node == (sceneView.scene as! MainScene).cubeNode {
                    self.spriteScene.score += 1
                }
            }
        }
    }
}

