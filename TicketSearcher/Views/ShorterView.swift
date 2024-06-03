//
//  ShorterView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct ShorterView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @StateObject var viewModel: ShorterVM

    var body: some View {
        Text("Страница \"Короче\"")
    }
}

#Preview {
    ShorterView(viewModel: ShorterVM())
}
