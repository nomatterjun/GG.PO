//
//  WidgetExtentsionBundle.swift
//  WidgetExtentsion
//
//  Created by Lee on 2023/06/10.
//

import WidgetKit
import SwiftUI

@main
struct WidgetExtentsionBundle: WidgetBundle {
    var body: some Widget {
        RecentWidget()
        WidgetExtentsionLiveActivity()
    }
}
