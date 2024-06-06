//
//  MainView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @State var tabBarHeight: CGFloat = 0

    var body: some View {
        ZStack {
            appCoordinator.rootView
                .padding(.bottom, tabBarHeight)
                .ignoresSafeArea([.container, .keyboard], edges: .bottom)

            VStack {
                Spacer()

// I leave it in the code to show the process of debugging
#if DEBUG
                // Button(action: {
                //     appCoordinator.activeScreen = .airTicketsCountry
                // }, label: {
                //     Text("Test airTicketsCountry")
                // })
#endif
                TabBarView(
                    height: $tabBarHeight,
                    viewModel: TabBarVM(activeScreen: appCoordinator.activeScreen)
                )
            }
            .ignoresSafeArea([.container, .keyboard], edges: .bottom)
        }
        .sheet(isPresented: $appCoordinator.showSheet) {
            appCoordinator.rootSheet
        }
    }
}

// MARK: - Preview
#Preview {
    MainView()
        .environmentObject(AppCoordinator())
}
