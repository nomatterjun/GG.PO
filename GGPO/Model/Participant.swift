//
//  Participant.swift
//  GGPO
//
//  Created by 이창준 on 6/12/23.
//

import Foundation
import SwiftData

@Model
final class Participant {
    let id: UUID = UUID()
    var individualPosition: String
    var lane: String
    var teamPosition: String
    var isWin: Bool
    @Attribute(.unique) var puuid: String

    init(dto: ParticipantDTO) {
        self.individualPosition = dto.individualPosition
        self.lane = dto.lane
        self.teamPosition = dto.teamPosition
        self.isWin = dto.isWin
        self.puuid = dto.puuid
    }
}

extension Participant: Identifiable { }

extension Participant: Hashable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        lhs.puuid == rhs.puuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.puuid)
    }
}
