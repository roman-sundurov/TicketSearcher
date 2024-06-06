//
//  ShorterView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct ShorterView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
        Text("Страница \"Короче\"")
    }
}

#Preview {
    ShorterView()
}
