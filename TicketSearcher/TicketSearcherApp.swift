//
//  TicketSearcherApp.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI
import SwiftData

@main
struct TicketSearcherApp: App {
    @ObservedObject private var appCoordinator = AppCoordinator()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(appCoordinator)
    }
}
