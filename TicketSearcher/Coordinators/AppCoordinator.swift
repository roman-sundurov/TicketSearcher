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

    /// Using for the control of NavigationStack screens (for the swipe animation)
    @Published var airTicketsTabPath: [NavigationStackScreen] = []

    /// Using for the control of Tab screens
    @Published var activeScreen: Screen {
        didSet {
            push(screen: activeScreen)
        }
    }

    /// Using for the control of Sheet screens
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
        activeScreen = .airTicketsView
        push(screen: .airTicketsView)
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
        return CountrySearchSheet()
            .environmentObject(viewModel)
    }

    // MARK: - Screens' Controls
    private func push(screen: Screen) {
        switch screen {
        case .airTicketsView:
            rootView = AnyView(airTickesView())
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

    /// Control of NavigationStack screens
    private func push(sheet: Sheet) {
        switch sheet {
        case .airTicketsSearch:
            rootSheet = AnyView(airTickets1SearchSheet())
        }
    }

    /// Add new NavigationStack screens
    func pushSwipeScreen(newSwipeScreen: NavigationStackScreen) {
        airTicketsTabPath.append(newSwipeScreen)
    }

    /// Go to the level down in the view hierarchy of NavigationStack screens
    func removeLastSwipeScreen() {
        airTicketsTabPath.removeLast()
    }

    // Used in the navigationDestination to handle transitions
    func getSwipeView(screen: NavigationStackScreen) -> AnyView {
        switch screen {
        case .airTicketsStart:
            return AnyView(airTickesView())
        case .airTicketsCountry:
            return AnyView(airTicketsCountry())
        case .airTicketsOptions:
            return AnyView(airTicketsOptionsView())
        }
    }
}
