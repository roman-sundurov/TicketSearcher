//
//  ProfileView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileVM
    var coordinator: AppCoordinator

    var body: some View {
        Text("Страница \"Профиль\"")
    }
}

#Preview {
    ProfileView(viewModel: ProfileVM(), coordinator: AppCoordinator())
}
