//
//  MainView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator

    var body: some View {
        ZStack {
            appCoordinator.rootView
            VStack {
                Spacer()
                TabBarView(viewModel: TabBarVM(activeScreen: appCoordinator.activeScreen))
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppCoordinator())
}
