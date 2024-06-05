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

#if DEBUG
                // Button(action: {
                //     appCoordinator.activeScreen = .airTicketsCountry
                // }, label: {
                //     Text("Test airTicketsCountry")
                // })
#endif

                TabBarView(viewModel: TabBarVM(activeScreen: appCoordinator.activeScreen))
            }
            .ignoresSafeArea([.container, .keyboard], edges: .bottom)
        }
        .sheet(isPresented: $appCoordinator.showSheet) {
            appCoordinator.rootSheet
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppCoordinator())
}
