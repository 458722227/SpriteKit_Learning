//
//  GameScene.swift
//  ZombieConga
//
//  Created by 4wd-ios on 2018/5/21.
//  Copyright © 2018年 ty4wd. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let zombie = SKSpriteNode(imageNamed: "zombie1")
    let zombieMovePointsPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        addChild(background)
    
        zombie.position = CGPoint(x: 400, y: 400)
        addChild(zombie)
    }
    
    override func update(_ currentTime: TimeInterval) {
        dt = lastUpdateTime > 0 ? currentTime - lastUpdateTime : 0
        lastUpdateTime = currentTime
        
        move(sprite: zombie, velocityPara: velocity)
    }
    
    func move(sprite: SKSpriteNode, velocityPara: CGPoint) {
        sprite.position += velocityPara * CGFloat(dt)
    }
    
    func moveZombieToward(location: CGPoint) {
        let offset = location - zombie.position
        let unitVector = offset.normalized()
        velocity = unitVector * zombieMovePointsPerSec
    }
    
    // MARK: 触摸屏幕
    func sceneTouched(touchLocation: CGPoint) {
        moveZombieToward(location: touchLocation)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            sceneTouched(touchLocation: touchLocation)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            sceneTouched(touchLocation: touchLocation)
        }
    }
}








