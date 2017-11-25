//
//  Box.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 12/29/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import Foundation

class Box {
    
    var traversed: Bool = false
    
    var preferenceValue: Double = 1.0
    
    var isGoalNode: Bool = false
    
    var value: Double = 0.0
    
    var portions: [Portion] = []
    
    var isAvailable: Bool = true
    
    var isSelected: Bool = false
    
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        
        self.x = x
        self.y = y
        
        populateBoxArray()
    }
    
    func populateBoxArray() {
        
        for _ in 0 ..< numberOfPortionsInABox {
            
            let portion = Portion()
            
            portions.append(portion)
        }
    }
}
