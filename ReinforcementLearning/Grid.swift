//
//  Grid.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 12/29/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import Foundation

protocol GridDelegate: class {
    
    func placeBox(box: Box)
    
    func redrawBox(box: Box)
}

class Grid {
    
    var boxArray: [[Box?]] = [[Box?]](repeating: [Box?](repeating: nil, count: maxX + 1), count: maxX + 1)
    
    weak var gridDelegate: GridDelegate?
    
    var selectedBox: Box?
    
    var goalBox: Box
    
    var isLearning: Bool = true
    
    init() {
        
        for y in 0 ... maxY {
            
            for x in 0 ... maxX {
                
                let box = Box(x: x, y: y)
                
                box.x = x
                box.y = y
                
                if y == 1 && x > 0 {
                    
                    box.isAvailable = false
                }
                
                boxArray[x][y] = box
            }
        }
        
        goalBox = boxArray[maxX][0]!
        
        goalBox.value = 1.0
        boxArray[maxX][1]?.value = -1.0
        
        goalBox.isGoalNode = true
        boxArray[maxX][1]?.isGoalNode = true
        
        selectedBox = getRandomBox()
        selectedBox?.isSelected = true
    }
    
    func selectRandomBox() {
        
        changeSelectedBox(box: selectedBox!, newBox: getRandomBox())
    }
    
    func getRandomBox() -> Box {
        
        let x: Int = 15
        let y: Int = 15
        
        let box: Box = boxArray[x][y]!
        
        if box.isGoalNode == false && box.isAvailable == true {
            
            return box
            
        } else {
            
            return getRandomBox()
        }
    }
    
    func takeTurn(direction: Direction) -> Bool {
        
        moveIsSelected(direction: direction)
        
        return true
    }
    
    func updateQValues(box: Box, newBox: Box, direction: Direction) {
        
        QLearning.updateQValues(box: box, newBox: newBox, direction: direction)
    }
    
    func moveIsSelected(direction: Direction) {
        
        var x: Int
        var y: Int
        
        if direction == Direction.Left {
            
            x = selectedBox!.x - 1
            y = selectedBox!.y
            
        } else if direction == Direction.Right {
            
            x = selectedBox!.x + 1
            y = selectedBox!.y
            
        } else if direction == Direction.Up {
            
            x = selectedBox!.x
            y = selectedBox!.y - 1
            
        } else {
            
            x = selectedBox!.x
            y = selectedBox!.y + 1
        }
        
        if x >= 0 && y >= 0 && x <= maxX && y <= maxY {
            
            if let newBox = boxArray[x][y] {
                
                updateQValues(box: selectedBox!, newBox: newBox, direction: direction)
                
                if newBox.isGoalNode == false {
                    
                    changeSelectedBox(box: selectedBox!, newBox: newBox)
                    
                } else {
                    
                    selectRandomBox()
                    
                    markEveryBoxUntraversed()
                }
                
                redrawBoxArray()
            }
        }
    }
    
    func findNeighbors(box: Box) -> [Box] {
        
        var neighborBoxArray: [Box] = []
        
        var x: Int
        var y: Int
        
        // Direction is Left
        x = selectedBox!.x - 1
        y = selectedBox!.y
        
        if x >= 0 && y >= 0 && x <= maxX && y <= maxY {
            
            if let newBox = boxArray[x][y] {
                
                if newBox.traversed == !isLearning && newBox.isAvailable == true {
                
                    neighborBoxArray.append(newBox)
                }
            }
        }
        
        // Direction is Right
        x = selectedBox!.x + 1
        y = selectedBox!.y
        
        if x >= 0 && y >= 0 && x <= maxX && y <= maxY {
            
            if let newBox = boxArray[x][y] {
                
                if newBox.traversed == !isLearning && newBox.isAvailable == true {
                    
                    neighborBoxArray.append(newBox)
                }
            }
        }
        
        // Direction is Up
        x = selectedBox!.x
        y = selectedBox!.y - 1
        
        if x >= 0 && y >= 0 && x <= maxX && y <= maxY {
            
            if let newBox = boxArray[x][y] {
                
                if newBox.traversed == !isLearning && newBox.isAvailable == true {
                    
                    neighborBoxArray.append(newBox)
                }
            }
        }
        
        // Direction is Down
        x = selectedBox!.x
        y = selectedBox!.y + 1
        
        if x >= 0 && y >= 0 && x <= maxX && y <= maxY {
            
            if let newBox = boxArray[x][y] {
                
                if newBox.traversed == !isLearning && newBox.isAvailable == true {
                    
                    neighborBoxArray.append(newBox)
                }
            }
        }
        
        return neighborBoxArray
    }
    
    func changeSelectedBox(box: Box, newBox: Box) {
        
        box.isSelected = false
        
        newBox.isSelected = true
        
        selectedBox = newBox
    }
    
    func placeBoxArray() {
        
        for y in 0 ..< boxArray.count {
            
            for x in 0 ..< boxArray[y].count {
                
                let box = boxArray[x][y]
                
                gridDelegate?.placeBox(box: box!)
            }
        }
    }
    
    func redrawBoxArray() {
        
        for y in 0 ..< boxArray.count {
            
            for x in 0 ..< boxArray[y].count {
                
                let box = boxArray[x][y]
                
                gridDelegate?.redrawBox(box: box!)
            }
        }
    }
    
    func markEveryBoxUntraversed() {
        
        for y in 0 ..< boxArray.count {
            
            for x in 0 ..< boxArray[y].count {
                
                boxArray[x][y]?.traversed = false
            }
        }
    }
}
