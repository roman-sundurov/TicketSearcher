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
    @Published var activeScreen: Screen {
        didSet {
            push(screen: activeScreen)
        }
    }

    init() {
        activeScreen = .airTickets
        push(screen: .airTickets)
    }

    private func airTickesView() -> some View {
        let viewModel = AirTicketsVM()
        return AirTicketsView(viewModel: viewModel, coordinator: self)
    }
    
    private func hotelsView() -> some View {
        let viewModel = HotelsVM()
        return HotelsView(viewModel: viewModel, coordinator: self)
    }

    private func shorterView() -> some View {
        let viewModel = ShorterVM()
        return ShorterView(viewModel: viewModel, coordinator: self)
    }

    private func norificationsView() -> some View {
        let viewModel = NotificationsVM()
        return NotificationsView(viewModel: viewModel, coordinator: self)
    }

    private func profileView() -> some View {
        let viewModel = ProfileVM()
        return ProfileView(viewModel: viewModel, coordinator: self)
    }

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
}
