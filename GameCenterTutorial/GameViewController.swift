//
//  GameViewController.swift
//  GameCenterTutorial
//
//  Created by Kevin Pham on 1/5/15.
//  Copyright (c) 2015 Nimble & Swift. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
  class func unarchiveFromFile(file : NSString) -> SKNode? {
    if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
      var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
      var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
      
      archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
      let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as GameScene
      archiver.finishDecoding()
      return scene
    } else {
      return nil
    }
  }
}

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Presenting scene without using GameScene.sks
    let skView = self.view as SKView
    let myScene = GameScene(size: skView.frame.size)
    skView.presentScene(myScene)
  }
  
  override func shouldAutorotate() -> Bool {
    return true
  }
  
  override func supportedInterfaceOrientations() -> Int {
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
      return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    } else {
      return Int(UIInterfaceOrientationMask.All.rawValue)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
}