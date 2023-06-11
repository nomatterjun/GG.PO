//
//  Record.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import Foundation

public struct Record: Identifiable, Hashable {
    let date: Date
    var isWin: Bool

    public var id: UUID = UUID()
}
