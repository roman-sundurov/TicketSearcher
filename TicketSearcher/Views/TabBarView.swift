//
//  TabBarView.swift
//  TicketSearcher
//
//  Created by Roman on 1/6/24.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @Binding var height: CGFloat
    var viewModel: TabBarVM

    var body: some View {
            HStack {
                ForEach(viewModel.buttonsDetails, id: \.self) { button in
                    VStack {
                        button.icon
                            .frame(width: 24, height: 24)
                        Text(button.text)
                            .fontTabText()
                            .foregroundStyle(viewModel.activeScreen == button.screen ? Color.blue : Color.tsGrey6)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        appCoordinator.activeScreen = button.screen
                        if button.screen == .airTicketsView {
                            appCoordinator.airTicketsTabPath = []
                        }
                    }
                }
            }
            .padding(.bottom, 45)
            .padding(.top, 6)
            .modifier(GetHeightModifier(height: $height))
            .padding(.horizontal, 4)
            .background(Color.tsBlack)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.tsGrey2),
                alignment: .top
            )
    }
}

// MARK: - Preview
#Preview {
    TabBarView(
        height: .constant(0),
        viewModel: TabBarVM(activeScreen: .airTicketsView)
    )
}
