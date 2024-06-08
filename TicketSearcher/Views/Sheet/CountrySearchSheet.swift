//
//  CountrySearchSheet.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import SwiftUI

struct CountrySearchSheet: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                AssetImage.closeSheetIcon.image
                    .frame(width: 38, height: 5)
                    .padding(.top, 16)

                VStack {
                    HStack {
                        AssetImage.airTicketsSheetFrom.image
                            .frame(width: 16, height: 16)

                        TextField("", text: $viewModel.fromCity)
                            .placeholder(when: viewModel.fromCity.isEmpty) {
                                Text("Откуда - Москва").foregroundColor(.gray)
                            }
                            .foregroundStyle(Color.white)
                            .padding(.leading, 8)
                            .onChange(of: viewModel.fromCity) { newText in
                                let filtered = newText.filter { $0.isCyrillic }
                                if filtered != newText {
                                    viewModel.fromCity = filtered
                                }
                            }
                            .onTapGesture {
                                print("Tap From fromTextField") // Using for avoid dissmis keyboard
                            }

                        if !viewModel.fromCity.isEmpty {
                            AssetImage.removeTextButton.image
                                .frame(width: 9, height: 9)
                                .onTapGesture {
                                    viewModel.fromCity = ""
                                }
                        }
                    }
                    .padding(.horizontal, 18)


                    Divider()
                        .background(Color.tsGrey6)
                        .frame(height: 1)

                    HStack {
                        AssetImage.airTicketsSheetTo.image
                            .frame(width: 16, height: 16)

                        TextField("", text: $viewModel.toCity)
                            .placeholder(when: viewModel.toCity.isEmpty) {
                                Text("Куда - Турция").foregroundColor(.gray)
                            }
                            .foregroundStyle(Color.white)
                            .padding(.leading, 8)
                            .onChange(of: viewModel.toCity) { newText in
                                let filtered = newText.filter { $0.isCyrillic }
                                if filtered != newText {
                                    self.viewModel.toCity = filtered
                                }
                            }
                            .onTapGesture {
                                print("Tap From toTextField") // Using for avoid dissmis keyboard
                                viewModel.showSearchSheet = true
                            }

                        if !viewModel.toCity.isEmpty {
                            AssetImage.removeTextButton.image
                                .frame(width: 9, height: 9)
                                .onTapGesture {
                                    viewModel.toCity = ""
                                }
                        }
                    }
                    .padding(.horizontal, 18)
                }
                .padding([.vertical, .trailing], 16)
                .background(Color.tsGrey4)
                .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
                .padding(.top, 25)

                RoutOptionsView()
                    .padding(.top, 26)

                PopularDestinationsView()
                    .padding(.top, 26)
            }
            .padding(.horizontal, 28)
        }
        .background(Color.tsGrey2)
    }
}

// MARK: - Preview
#Preview {
    CountrySearchSheet()
        .environmentObject(AppCoordinator())
        .environmentObject(AirTicketsVM.shared)
}
