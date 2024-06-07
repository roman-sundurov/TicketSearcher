//
//  StubView.swift
//  TicketSearcher
//
//  Created by Roman on 6/6/24.
//

import SwiftUI

struct StubView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
        HStack {
            AssetImage.airTicketsOptionsBackButton.image
                .onTapGesture {
                    appCoordinator.activeSheet = .airTicketsSearch
                    withAnimation(.easeInOut(duration: 2.0)) {
                        appCoordinator.pushSwipeScreen(newSwipeScreen: .airTicketsOptions)
                    }
                }
            Text(viewModel.stubViewScreenName)
        }
    }
}

var previewAirTicketsVM = AirTicketsVM.shared
#Preview {
    StubView()
        .environmentObject(AppCoordinator())
        .environmentObject(AirTicketsVM.shared)
        .onAppear {
            previewAirTicketsVM.stubViewScreenName = "Test screen name"
        }
}
