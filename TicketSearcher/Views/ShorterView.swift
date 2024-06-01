//
//  ShorterView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct ShorterView: View {
    @StateObject var viewModel: ShorterVM
    var coordinator: AppCoordinator

    var body: some View {
        Text("Страница \"Короче\"")
    }
}

#Preview {
    ShorterView(viewModel: ShorterVM(), coordinator: AppCoordinator())
}
