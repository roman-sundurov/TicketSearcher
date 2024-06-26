//
//  TicketSearcherApp.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI
// import SwiftData | Commented for preparing for implement SwiftData

@main
struct TicketSearcherApp: App {
    @ObservedObject private var appCoordinator = AppCoordinator()

    // TODO: - Commented for preparing for implement SwiftData
    // var sharedModelContainer: ModelContainer = {
    //     let schema = Schema([
    //         Item.self,
    //     ])
    //     let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    // 
    //     do {
    //         return try ModelContainer(for: schema, configurations: [modelConfiguration])
    //     } catch {
    //         fatalError("Could not create ModelContainer: \(error)")
    //     }
    // }()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appCoordinator)
        }
        // .modelContainer(sharedModelContainer) | Commented for preparing for implement SwiftData
        // .environmentObject(appCoordinator)
    }
}
