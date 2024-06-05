//
//  NotificationsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
        Text("Страница \"Подписки\"")
    }
}

#Preview {
    NotificationsView()
}
