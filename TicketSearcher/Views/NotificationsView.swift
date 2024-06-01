//
//  NotificationsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var viewModel: NotificationsVM
    var coordinator: AppCoordinator

    var body: some View {
        Text("Страница \"Подписки\"")
    }
}

#Preview {
    NotificationsView(viewModel: NotificationsVM(), coordinator: AppCoordinator())
}
