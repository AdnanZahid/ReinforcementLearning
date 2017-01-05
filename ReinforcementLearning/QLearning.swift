//
//  QLearning.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 12/30/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import Foundation

class QLearning {

    static func updateQValues(box: Box, newBox: Box, direction: Direction) {
        
        var updatablePortion: Portion
        
        if direction == Direction.Left {
            
            updatablePortion = box.portions[0]
            
        } else if direction == Direction.Right {
            
            updatablePortion = box.portions[1]
            
        } else if direction == Direction.Down {
            
            updatablePortion = box.portions[2]
            
        } else {
            
            updatablePortion = box.portions[3]
        }
        
//        updatablePortion.qValue = (1 - updatablePortion.learning) * updatablePortion.qValue + updatablePortion.learning * (rewardForEachState + discountFactor * newBox.value)
        
        let changeInQValue: Double = (newBox.value - updatablePortion.qValue) * updatablePortion.learning
        
        updatablePortion.qValue += changeInQValue
        
        /**
         * If and only if changeInQValue is greater than zero
         */
        if changeInQValue > 0 {
        
            /**
             * Decrease Q Learning value over time for less learning rate (for convergence of values)
             */
            updatablePortion.learning *= 1.0 - (changeInQValue * 0.99999)
        }
        
        var maxQValue: Double = 0.0
        for portion in box.portions {
            
            maxQValue = max(maxQValue, portion.qValue)
        }
        
        box.value = maxQValue
        
        box.preferenceValue *= 0.9
        
        box.traversed = true
    }
}
