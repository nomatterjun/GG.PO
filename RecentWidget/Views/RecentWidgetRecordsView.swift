//
//  RecentWidgetRecordsView.swift
//  Widgets
//
//  Created by 이창준 on 6/10/23.
//

import SwiftUI
import WidgetKit

struct RecentWidgetRecordsView: View {
    @State var matches: [Match]

    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8),
        GridItem(.flexible(minimum: 32), spacing: 8)
    ]

    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 6) {
            ForEach(self.matches, id: \.id) { i in
                RoundedRectangle(cornerRadius: 4)
                    .fill(i.isWin ? .blue : .red)
                    .frame(height: 32)
            }
        }
    }
}

#Preview {
    RecentWidgetRecordsView(matches: [Match.random()])
}
