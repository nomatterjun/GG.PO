//
//  VersusWidget.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import SwiftUI
import WidgetKit

struct VersusProvider: TimelineProvider {
    func placeholder(in context: Context) -> VersusEntry {
        VersusEntry(date: Date(), emoji: "😀", duration: 0, widgetScreen: context.displaySize)
    }

    func getSnapshot(in context: Context, completion: @escaping (VersusEntry) -> ()) {
        let entry = VersusEntry(date: Date(), emoji: "😀", duration: 0, widgetScreen: context.displaySize)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<VersusEntry>) -> ()) {
        var entries: [VersusEntry] = []
       
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 3 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = VersusEntry(date: entryDate, emoji: "😀", duration: Double(Double(hourOffset) / 2), widgetScreen: context.displaySize)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct VersusEntry: TimelineEntry {
    let date: Date
    let emoji: String
    let duration: Double
    let widgetScreen: CGSize
}


struct VersusWidgetEntryView : View {
    var entry: VersusProvider.Entry
    
    var body: some View {
        VersusWidgetSystemLargeView(entry: entry)
    }
}

struct VersusWidget: Widget {
    let kind: String = "VersusWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VersusProvider()) { entry in
            VersusWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("결투")
        .description("다른 소환사와 티어 대결을 해보세요.")
        .supportedFamilies([.systemLarge])
    }
}

#Preview(as: .systemLarge) {
    VersusWidget()
} timeline: {
    VersusEntry(date: .now, emoji: "😀", duration: 0, widgetScreen: CGSize(width: 300, height: 400))
    VersusEntry(date: .now, emoji: "🤩", duration: 1,widgetScreen: CGSize(width: 300, height: 400))
}
