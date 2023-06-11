//
//  RecentWidgetEntryView.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI

struct RecentWidgetEntryView: View {
    var entry: RecentWidgetProvider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch self.family {
        case .systemMedium:
            HStack(alignment: .top, spacing: 24) {
                RecentWidgetInfoView(entry: self.entry)
                RecentWidgetRecordsView(entry: self.entry)
            }
        default:
            Text("sdf")
        }
    }
}
