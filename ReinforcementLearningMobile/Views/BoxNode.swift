//
//  BoxNode.swift
//  TwoZeroFourEight
//
//  Created by Adnan Zahid on 12/20/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class BoxNode: SKSpriteNode {
    
    var leftLabelNode: PortionNode = PortionNode()
    var rightLabelNode: PortionNode = PortionNode()
    var topLabelNode: PortionNode = PortionNode()
    var bottomLabelNode: PortionNode = PortionNode()
    
    var centerLabelNode: PortionNode = PortionNode()
    
    var portionNodes: [PortionNode] = []
    
    var center: SKShapeNode = SKShapeNode(circleOfRadius: kBlockSize/4)
    
    var isSelected: Bool = false
    
    convenience init(blockSize: CGFloat) {
        
        self.init(color: SKColor.clear, size: CGSize(width: blockSize, height: blockSize))
        
        leftLabelNode.position = CGPoint(x: position.x - blockSize, y: 0)
        rightLabelNode.position = CGPoint(x: position.x + blockSize, y: 0)
        topLabelNode.position = CGPoint(x: 0, y: position.y - blockSize)
        bottomLabelNode.position = CGPoint(x: 0, y: position.y + blockSize)
        
        addChild(leftLabelNode)
        addChild(rightLabelNode)
        addChild(topLabelNode)
        addChild(bottomLabelNode)
        
        addChild(centerLabelNode)
        
        center.position = CGPoint(x: 0, y: 10.0)
        
        center.strokeColor = SKColor.clear
        center.fillColor = SKColor.darkGray
        
        addChild(center)
        
        portionNodes = [leftLabelNode, rightLabelNode, topLabelNode, bottomLabelNode]
    }
    
    func showSelected(selected: Bool) {
        
        isSelected = selected
        
        center.isHidden = !isSelected
    }
    
    override init(texture: SKTexture!, color: SKColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeNumberInPortion(number: Double, portionNode: PortionNode) {
        
        portionNode.changeNumber(number: number)
    }
    
    func redraw(box: Box) {
        
        let colorValue: CGFloat = CGFloat(box.value)
        
        color = SKColor.init(red: 0.0, green: colorValue, blue: 0.0, alpha: colorValue)
        
        showSelected(selected: box.isSelected)
        
        centerLabelNode.changeNumber(number: box.value)
        
        centerLabelNode.isHidden = !box.isAvailable
        
        for x in 0 ..< portionNodes.count {
            
            portionNodes[x].isHidden = true
            
            portionNodes[x].changeNumber(number: box.portions[x].qValue)
        }
    }
}
