//
//  User.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var tier: String
    var point: Int
    var mostChapion: Champion?
    
    init(name: String, tier: String, point: Int, mostChapion: Champion? = nil) {
        self.name = name
        self.tier = tier
        self.point = point
        self.mostChapion = mostChapion
    }
}
