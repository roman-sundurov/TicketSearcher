//
//  AirTicketsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct AirTicketsView: View {
    @StateObject var viewModel: AirTicketsVM
    var coordinator: AppCoordinator

    var body: some View {
        Text("Страница \"Авиабилеты\"")
    }
}

#Preview {
    AirTicketsView(viewModel: AirTicketsVM(), coordinator: AppCoordinator())
}
