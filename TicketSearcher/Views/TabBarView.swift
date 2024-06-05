//
//  TabBarView.swift
//  TicketSearcher
//
//  Created by Roman on 1/6/24.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    var viewModel: TabBarVM

    var body: some View {
            HStack {
                ForEach(viewModel.buttonsDetails, id: \.self) { button in
                    VStack {
                        button.icon
                            .frame(width: 24, height: 24)
                        Text(button.text)
                            .fontTabText()
                            .foregroundStyle(viewModel.screenTabBarMatch(screen: viewModel.activeScreen) == button.screen ? Color.blue : Color.tsGrey6)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        appCoordinator.activeScreen = button.screen
                    }
                }
            }
            .padding(.top, 6)
            .padding(.bottom, 45)
            .padding(.horizontal, 4)
            .background(Color.tsBlack)
        // }
    }
}

#Preview {
    TabBarView(viewModel: TabBarVM(activeScreen: .airTicketsStart))
}
