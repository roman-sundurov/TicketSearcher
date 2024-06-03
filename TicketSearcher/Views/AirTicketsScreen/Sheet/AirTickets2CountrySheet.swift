//
//  AirTickets2CountrySheet.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import SwiftUI

struct AirTickets2CountrySheet: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    AirTickets2CountrySheet()
        .environmentObject(AppCoordinator())
}
