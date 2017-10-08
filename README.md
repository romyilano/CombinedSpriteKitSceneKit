# Tuts+ Tutorial: Combining the Power of SpriteKit and SceneKit

* https://code.tutsplus.com/tutorials/combining-the-power-of-spritekit-and-scenekit--cms-24049


## Tips 

### Use overlaySKScene to add SpriteKit to SceneKit

* "The SpriteKit overlay goes on the SceneKit view not on the SceneKit scene" - [stackOverflow troubleshooting](https://stackoverflow.com/questions/34584257/how-can-i-overlay-a-skscene-over-a-scnscene-in-swift)
* [How to create an HUD overlay on a sceneKitScene](https://stackoverflow.com/questions/24419193/how-do-i-create-a-hud-on-top-of-my-scenekit-scene)

* SCNSceneRenderer property [overlaySKScene](https://developer.apple.com/documentation/scenekit/scnscenerenderer/1524051-overlayskscene)

	_Use this property to render 2D content that overlays your scene—for example, a heads-up-display for a game. The Sprite Kit scene shares the same underlying GPU resources as the SceneKit renderer, so using this property can provide much better performance than overlaying other views or layers above the view rendering your SceneKit content._



---

#### Instructor: Davis Allie

SpriteKit and SceneKit are iOS frameworks designed to make it easy for developers to create 2D and 3D assets in casual games. In this tutorial, I will show you how to combine content created in both frameworks into a single view to utilize the APIs that Apple has made available.

Source files for the starter project of the Tuts+ tutorial: [Combining the Power of SpriteKit and SceneKit](http://code.tutsplus.com/tutorials/combining-the-power-of-spritekit-and-scenekit--cms-24049)

**Read this tutorial on [Tuts+](https://code.tutsplus.com)**
