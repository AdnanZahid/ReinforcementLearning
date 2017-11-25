//
//  AISolver.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 1/2/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import Foundation

protocol AIDelegate: class {
    
    func didCalculateNextMove(box: Box)
    
    func gameOver()
}

class AISolver {
    
    weak var delegate: AIDelegate?
    
    func calculateNextMove(grid: Grid) {
        
        let box: Box = grid.selectedBox!
        
        var maxValueBox: Box?
        
        let neighborBoxArray: [Box] = grid.findNeighbors(box: box).shuffled()
        
        if neighborBoxArray.count > 0 {
            
            maxValueBox = neighborBoxArray[0]
            
            for neighborBox in neighborBoxArray {
                
                let maxValue: Double = (maxValueBox!.value) * 1000000
//                    + maxValueBox!.preferenceValue
                //                    + calculateManhattanDistance(sourceBox: maxValueBox!, destinationBox: grid.goalBox)
//                                    + calculateRandomNumber(sourceBox: maxValueBox!)
                
                let neighborBoxValue: Double = (neighborBox.value) * 1000000
//                    + neighborBox.preferenceValue
                //                    + calculateManhattanDistance(sourceBox: neighborBox, destinationBox: grid.goalBox)
//                                    + calculateRandomNumber(sourceBox: neighborBox)
                
                if maxValue < neighborBoxValue {
                    
                    maxValueBox = neighborBox
                }
            }
        }
        
        if let nextBox: Box = maxValueBox {
            
            delegate?.didCalculateNextMove(box: nextBox)
            
        } else {
            
            delegate?.gameOver()
        }
    }
    
    func calculateManhattanDistance(sourceBox: Box, destinationBox: Box) -> Double {
        
        return 1/Double((destinationBox.x - sourceBox.x) ^^ 2 + (destinationBox.y - sourceBox.y) ^^ 2)
    }
    
    func calculateRandomNumber(sourceBox: Box) -> Double {
        
        return Double(arc4random_uniform(1000000)) * (1 - sourceBox.value)
    }
}
