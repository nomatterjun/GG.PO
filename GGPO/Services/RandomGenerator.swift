//
//  RandomGenerator.swift
//  GGPO
//
//  Created by 이창준 on 6/12/23.
//

import Foundation

class RandomGenerator {
    // Helper function to generate a random integer within a range
    static func randomInt(from: Int, to: Int) -> Int {
        return Int.random(in: from...to)
    }

    // Helper function to generate a random string with a given length
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
