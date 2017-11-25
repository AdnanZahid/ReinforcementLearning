//
//  GridView.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 12/20/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

class GridView: SKSpriteNode {
    
    var blockSize: CGFloat?
    var rows: Int?
    var columns: Int?
    
    convenience init(blockSize: CGFloat, rows: Int, columns: Int) {
        
        let texture = SKTexture()
        
        self.init(texture: texture, color:SKColor.clear, size: texture.size())
        
        self.blockSize = blockSize
        self.rows = rows
        self.columns = columns
    }
    
    override init(texture: SKTexture!, color: SKColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gridPosition(row: Int, column: Int) -> CGPoint {
        
        let xOffset = blockSize! / 2.0
        
        let yOffset = blockSize! / 2.0 - 10.0
        
        let x = CGFloat(column) * blockSize! - (blockSize! * CGFloat(columns!)) / 2.0 + xOffset
        
        let y = CGFloat(rows! - row - 1) * blockSize! - (blockSize! * CGFloat(rows!)) / 2.0 + yOffset
        
        return CGPoint(x:x, y:y)
    }
}
