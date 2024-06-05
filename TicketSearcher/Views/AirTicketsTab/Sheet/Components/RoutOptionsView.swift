//
//  RoutOptionsView.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import SwiftUI

struct RoutOptionsView: View {
    @ObservedObject var viewModel: AirTicketsVM

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                AssetImage.difficultRouteButton.image
                    .frame(width: 48, height: 48)
                Text("Сложный маршрут")
                    .fontRoutOptionsButton()
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                // TODO: - add stub
            }

            VStack {
                AssetImage.anywhereButton.image
                    .frame(width: 48, height: 48)
                Text("Куда угодно")
                    .fontRoutOptionsButton()
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                viewModel.anywhereButton()
            }

            VStack {
                AssetImage.difficultRouteButton.image
                    .frame(width: 48, height: 48)
                Text("Выходные")
                    .fontRoutOptionsButton()
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                // TODO: - add stub
            }

            VStack {
                AssetImage.hotTicketsButton.image
                    .frame(width: 48, height: 48)
                Text("Горячие билеты")
                    .fontRoutOptionsButton()
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                // TODO: - add stub
            }
        }
    }
}

// MARK: - Preview
#Preview {
    RoutOptionsView(viewModel: AirTicketsVM())
}
