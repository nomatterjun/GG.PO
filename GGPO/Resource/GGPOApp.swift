//
//  GGPOApp.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct GGPOApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
