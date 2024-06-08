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
                            .foregroundColor(Color.white)
                            .fontTitle3()
                        Text("Популярное направление")
                            .fontText2()
                            .foregroundStyle(Color.tsGrey5)
                    }
                    .padding(.leading, 8)
                    .onTapGesture {
                        print("Tap From fromTextField") // Using for avoid dissmis keyboard
                        viewModel.toCity = "Стамбул"
                        if viewModel.fromCity.isEmpty {
                            viewModel.fromCity = "Москва"
                        }
                        appCoordinator.airTicketsTabPath.append(.airTicketsCountry)
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
                            .foregroundColor(Color.white)
                            .fontTitle3()
                        Text("Популярное направление")
                            .fontText2()
                            .foregroundStyle(Color.tsGrey5)
                    }
                    .padding(.leading, 8)
                    .onTapGesture {
                        print("Tap From fromTextField") // Using for avoid dissmis keyboard
                        viewModel.toCity = "Сочи"
                        if viewModel.fromCity.isEmpty {
                            viewModel.fromCity = "Москва"
                        }
                        appCoordinator.airTicketsTabPath.append(.airTicketsCountry)
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
                            .foregroundColor(Color.white)
                            .fontTitle3()
                        Text("Популярное направление")
                            .fontText2()
                            .foregroundStyle(Color.tsGrey5)
                    }
                    .padding(.leading, 8)
                    .onTapGesture {
                        print("Tap From fromTextField") // Using for avoid dissmis keyboard
                        viewModel.toCity = "Пхукет"
                        if viewModel.fromCity.isEmpty {
                            viewModel.fromCity = "Москва"
                        }
                        appCoordinator.airTicketsTabPath.append(.airTicketsCountry)
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

// MARK: - Preview
#Preview {
    PopularDestinationsView()
        .environmentObject(AppCoordinator())
        .environmentObject(AirTicketsVM.shared)
}
