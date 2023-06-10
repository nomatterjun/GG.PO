//
//  WidgetExtentsionLiveActivity.swift
//  WidgetExtentsion
//
//  Created by Lee on 2023/06/10.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetExtentsionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetExtentsionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetExtentsionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetExtentsionAttributes {
    fileprivate static var preview: WidgetExtentsionAttributes {
        WidgetExtentsionAttributes(name: "World")
    }
}

extension WidgetExtentsionAttributes.ContentState {
    fileprivate static var smiley: WidgetExtentsionAttributes.ContentState {
        WidgetExtentsionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetExtentsionAttributes.ContentState {
         WidgetExtentsionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetExtentsionAttributes.preview) {
   WidgetExtentsionLiveActivity()
} contentStates: {
    WidgetExtentsionAttributes.ContentState.smiley
    WidgetExtentsionAttributes.ContentState.starEyes
}
