//
//  Champion.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import Foundation
import SwiftData

@Model
final class Champion {
    var name: String
    var tier: Int
    var line: String
    
    init(name: String, tier: Int, line: String) {
        self.name = name
        self.tier = tier
        self.line = line
    }
}
