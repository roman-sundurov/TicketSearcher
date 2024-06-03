//
//  ProfileView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @StateObject var viewModel: ProfileVM

    var body: some View {
        Text("Страница \"Профиль\"")
    }
}

#Preview {
    ProfileView(viewModel: ProfileVM())
}
