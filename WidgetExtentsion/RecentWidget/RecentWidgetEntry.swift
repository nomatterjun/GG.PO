//
//  RecentWidgetEntry.swift
//  GGPO
//
//  Created by 이창준 on 6/11/23.
//

import WidgetKit

struct RecentWidgetEntry: TimelineEntry {
    let date: Date
    let matches: [Match]
    let relevance: TimelineEntryRelevance?
}
