//
//  RecentWidgetRecordsView.swift
//  Widgets
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI
import WidgetKit

struct RecentWidgetRecordsView: View {
    var summoner: String
    var matches: [Match]

    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8)
    ]

    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 6) {
            ForEach(self.matches.prefix(15), id: \.id) { match in
                RoundedRectangle(cornerRadius: 4)
                    .fill(match.isWin(for: summoner) ? .blue : .red)
                    .frame(height: 32)
            }
        }
    }
}

#Preview {
    RecentWidgetRecordsView(summoner: "", matches: [Match.random()])
}
