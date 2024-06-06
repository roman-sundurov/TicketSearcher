//
//  AppCoordinator.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var rootView: AnyView?
    @Published var rootSheet: AnyView?
    @Published var showSheet = false

    @Published var activeScreen: Screen {
        didSet {
            push(screen: activeScreen)
        }
    }

    @Published var activeSheet: Sheet? {
        didSet {
            if let activeSheet {
                push(sheet: activeSheet)
                showSheet = true
            } else {
                showSheet = false
            }
        }
    }

    init() {
        activeScreen = .airTicketsStart
        push(screen: .airTicketsStart)
    }

    // MARK: Tab Screens
    // AirTickets tab
    private func airTickesView() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTicketsStartView()
            .environmentObject(viewModel)
    }

    private func airTicketsCountry() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTicketsCountryView()
            .environmentObject(viewModel)
    }

    private func airTicketsOptionsView() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTicketsOptionsView()
            .environmentObject(viewModel)
    }

    private func stubView() -> some View {
        let viewModel = AirTicketsVM.shared
        return StubView()
            .environmentObject(viewModel)
    }

    // Hotel tab
    private func hotelsView() -> some View {
        let viewModel = HotelsVM()
        return HotelsView()
            .environmentObject(viewModel)
    }

    // Shorter tab
    private func shorterView() -> some View {
        let viewModel = ShorterVM()
        return ShorterView()
            .environmentObject(viewModel)
    }

    // Notification tab
    private func norificationsView() -> some View {
        let viewModel = NotificationsVM()
        return NotificationsView()
            .environmentObject(viewModel)
    }

    // Profile tab
    private func profileView() -> some View {
        let viewModel = ProfileVM()
        return ProfileView()
            .environmentObject(viewModel)
    }

    // MARK: Sheets
    // AirTickets tab
    private func airTickets1SearchSheet() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTickets1SearchSheet()
            .environmentObject(viewModel)
    }

    // MARK: - Controlls
    private func push(screen: Screen) {
        switch screen {
        case .airTicketsStart:
            rootView = AnyView(airTickesView())
        case .airTicketsCountry:
            rootView = AnyView(airTicketsCountry())
        case .airTicketsOptions:
            rootView = AnyView(airTicketsOptionsView())
        case .stub:
            rootView = AnyView(stubView())
        case .hotels:
            rootView = AnyView(hotelsView())
        case . shorter:
            rootView = AnyView(shorterView())
        case .notifications:
            rootView = AnyView(norificationsView())
        case .profile:
            rootView = AnyView(profileView())
        }
    }

    private func push(sheet: Sheet) {
        switch sheet {
        case .airTicketsSearch:
            rootSheet = AnyView(airTickets1SearchSheet())
        }
    }
}
