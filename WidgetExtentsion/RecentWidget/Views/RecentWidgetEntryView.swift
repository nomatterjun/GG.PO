//
//  RecentWidgetEntryView.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import SwiftUI

struct RecentWidgetEntryView: View {
    var entry: RecentWidgetProvider.Entry

    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            RecentWidgetInfoView(entry: self.entry)
            RecentWidgetRecordsView(entry: self.entry)
        }
        .containerBackground(.background.tertiary, for: .widget)
    }
}
