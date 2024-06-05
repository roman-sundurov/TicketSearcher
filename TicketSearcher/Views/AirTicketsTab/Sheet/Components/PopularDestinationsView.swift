//
//  PopularDestinationsView.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import SwiftUI

struct PopularDestinationsView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
        VStack {
            VStack {
                HStack {
                    AssetImage.destinationIstanbul.image
                        .frame(width: 40, height: 40)
                        .padding(.vertical, 8)

                    VStack(alignment: .leading) {
                        Text("Стамбул")
                            .foregroundStyle(Color.white)
                            .fontTitle3()
                        Text("Популярное направление")
                            .fontText2()
                            .foregroundStyle(Color.tsGrey5)
                    }
                    .padding(.leading, 8)
                    .onTapGesture {
                        print("Tap From fromTextField") // Using for avoid dissmis keyboard
                        viewModel.to = "Стамбул"
                        appCoordinator.activeScreen = .airTicketsCountry
                        appCoordinator.activeSheet = nil
                    }

                    Spacer(minLength: 0)
                }


                Divider()
                    .background(Color.tsGrey5)
                    .frame(height: 1)

                HStack {
                    AssetImage.destinationSochi.image
                        .frame(width: 40, height: 40)
                        .padding(.vertical, 8)

                    VStack(alignment: .leading) {
                        Text("Сочи")
                            .foregroundStyle(Color.white)
                            .fontTitle3()
                        Text("Популярное направление")
                            .fontText2()
                            .foregroundStyle(Color.tsGrey5)
                    }
                    .padding(.leading, 8)
                    .onTapGesture {
                        print("Tap From fromTextField") // Using for avoid dissmis keyboard
                        viewModel.to = "Сочи"
                        appCoordinator.activeScreen = .airTicketsCountry
                        appCoordinator.activeSheet = nil
                    }

                    Spacer(minLength: 0)
                }


                Divider()
                    .background(Color.tsGrey5)
                    .frame(height: 1)

                HStack {
                    AssetImage.destinationPhuket.image
                        .frame(width: 40, height: 40)
                        .padding(.vertical, 8)

                    VStack(alignment: .leading) {
                        Text("Пхукет")
                            .foregroundStyle(Color.white)
                            .fontTitle3()
                        Text("Популярное направление")
                            .fontText2()
                            .foregroundStyle(Color.tsGrey5)
                    }
                    .padding(.leading, 8)
                    .onTapGesture {
                        print("Tap From fromTextField") // Using for avoid dissmis keyboard
                        viewModel.to = "Пхукет"
                        appCoordinator.activeScreen = .airTicketsCountry
                        appCoordinator.activeSheet = nil
                    }

                    Spacer(minLength: 0)
                }


                Divider()
                    .background(Color.tsGrey5)
                    .frame(height: 1)
            }
            .padding(16)
        }
        .background(Color.tsGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
    }
}

#Preview {
    PopularDestinationsView()
}
