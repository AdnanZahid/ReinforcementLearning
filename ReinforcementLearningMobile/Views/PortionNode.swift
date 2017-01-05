//
//  PortionNode.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 12/30/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class PortionNode: SKSpriteNode {
    
    let labelNode: SKLabelNode = SKLabelNode()
    
    convenience init() {
        
        self.init(color: SKColor.clear, size: CGSize(width: 40.0, height: 40.0))
        
        labelNode.text = "0.0"
        labelNode.fontSize = kBlockSize/2
        
        addChild(labelNode)
    }
    
    override init(texture: SKTexture!, color: SKColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeNumber(number: Double) {
        
        labelNode.text = String(number.roundTo(places: 2))
    }
}
