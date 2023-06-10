//
//  VersusWidgetSystemLargeView.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import SwiftUI
import WidgetKit

struct VersusWidgetSystemLargeView: View {
    var entry: VersusProvider.Entry
    @State private var firstChange = false
    @State private var secondChange = false
    var body: some View {
        let width: CGFloat = entry.widgetScreen.width
        let height: CGFloat = entry.widgetScreen.height
        
        ZStack {
            ZStack {
                Image("galio")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipShape(Trapezium(offset: 1 - entry.duration, corner: .bottomRight))
                Image("lulu")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipShape(Trapezium(offset: entry.duration, corner: .topLeft ))
            }
            Button {
                WidgetCenter.shared.reloadTimelines(ofKind: "VersusWidget")
            } label: {
                Image("versus-icon")
                    .resizable()
                    .frame(width: 40,height: 40)
            }
        }
    }
}

#Preview {
    VersusWidgetSystemLargeView(entry: VersusEntry(date: .now, emoji: "😀", duration: 0, widgetScreen: CGSize(width: 300, height: 400)))
}
