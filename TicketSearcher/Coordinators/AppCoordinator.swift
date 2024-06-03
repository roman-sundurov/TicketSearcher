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

    @Published var showSheet = false

    init() {
        activeScreen = .airTickets
        push(screen: .airTickets)
    }

    // MARK: Tab Screens
    private func airTickesView() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTicketsView()
            .environmentObject(viewModel)
    }
    
    private func hotelsView() -> some View {
        let viewModel = HotelsVM()
        return HotelsView(viewModel: viewModel)
    }

    private func shorterView() -> some View {
        let viewModel = ShorterVM()
        return ShorterView(viewModel: viewModel)
    }

    private func norificationsView() -> some View {
        let viewModel = NotificationsVM()
        return NotificationsView(viewModel: viewModel)
    }

    private func profileView() -> some View {
        let viewModel = ProfileVM()
        return ProfileView(viewModel: viewModel)
    }

    // MARK: Sheets
    private func airTickets1SearchSheet() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTickets1SearchSheet()
            .environmentObject(viewModel)
    }

    private func airTickets2CountrySheet() -> some View {
        let viewModel = AirTicketsVM.shared
        return AirTickets2CountrySheet()
            .environmentObject(viewModel)
    }

    // MARK: - Controlls
    private func push(screen: Screen) {
        switch screen {
        case .airTickets:
            rootView = AnyView(airTickesView())
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
        case .airTickets1Search:
            rootSheet = AnyView(airTickets1SearchSheet())
        case .airTickets2Country:
            rootSheet = AnyView(airTickets2CountrySheet())
        case . airTickets2Options:
            rootSheet = AnyView(airTickets2CountrySheet())
        }
    }
}
