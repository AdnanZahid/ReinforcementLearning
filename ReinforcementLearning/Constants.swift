//
//  Constants.swift
//  ReinforcementLearning
//
//  Created by Adnan Zahid on 12/29/16.
//  Copyright © 2016 Adnan Zahid. All rights reserved.
//

import SpriteKit

let maxX = 15
let maxY = 15
let numberOfPortionsInABox = 4

let discountFactor: Double = 0.1

let rewardForEachState: Double = 0

let kAnimationDuration: Double = 0.3

var aiSolver: AISolver?

let kBlockSize: CGFloat = 17.0
let kNumberOfRows: Int = maxX + 1
let kNumberOfColumns: Int = maxY + 1

enum Direction {
    
    case Up
    case Left
    case Right
    case Down
}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
