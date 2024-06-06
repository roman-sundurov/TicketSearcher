//
//  AirTicketsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct AirTicketsStartView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var body: some View {
            VStack {
                ScrollView(.vertical) {
                    Text("Поиск дешевых авиабилетов")
                        .fontTitle1()
                        .foregroundStyle(Color.noNameColors1)
                        .frame(width: 172)
                        .multilineTextAlignment(.center)

                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            AssetImage.searchIcon.image
                                .frame(width: 16, height: 16)
                                .padding(.leading, 12)
                                .padding(.trailing, 21)

                            VStack {
                                // MARK: - From block
                                HStack {
                                    TextField("", text: $viewModel.fromCity)
                                        .placeholder(when: viewModel.fromCity.isEmpty) {
                                            Text("Откуда - Москва").foregroundColor(.gray)
                                        }
                                        .foregroundStyle(Color.white)
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


                                Divider()
                                    .background(Color.tsGrey6)
                                    .frame(height: 1)

                                // MARK: - To block
                                HStack {
                                    // I commented on the TextFiled and used the Text below because the technical task says the modal window should open after the user taps the destination field. So I leave the TextFiled commented just in case as the second option.

                                    // TextField("", text: $toCity)
                                    //     .placeholder(when: toCity.isEmpty) {
                                    //         Text("Куда - Турция").foregroundColor(.gray)
                                    //     }
                                    //     .foregroundStyle(Color.white)
                                    //     .onChange(of: toCity) { text in
                                    //         let filtered = text.filter { $0.isCyrillic }
                                    //         if filtered != text {
                                    //             self.toCity = filtered
                                    //         }
                                    //     }
                                    //     .onTapGesture {
                                    //         print("Tap From toTextField") // Using for avoid dissmis keyboard
                                    //         showSearchSheet = true
                                    //     }

                                    HStack {
                                        Text(viewModel.toCity)
                                            .placeholder(when: viewModel.toCity.isEmpty) {
                                                Text("Куда - Турция").foregroundColor(.gray)
                                            }
                                            .foregroundStyle(Color.white)
                                        Spacer(minLength: 0)
                                    }
                                    .background(Color.tsGrey4)
                                    .padding(.trailing)
                                    .onTapGesture {
                                        print("Tap From toTextField") // Using for avoid dissmis keyboard
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        // viewModel.showSearchSheet = true
                                        appCoordinator.activeSheet = .airTicketsSearch
                                    }

                                    Spacer(minLength: 0)

                                    if !viewModel.toCity.isEmpty {
                                        AssetImage.removeTextButton.image
                                            .frame(width: 9, height: 9)
                                            .onTapGesture {
                                                viewModel.toCity = ""
                                            }
                                    }
                                }
                            }
                            .padding(.vertical, 16)
                            .padding(.trailing, 16)
                        }
                        .background(Color.tsGrey4)
                        .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
                        .padding(16)
                    }
                    .background(Color.tsGrey2)
                    .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
                    .padding(.top, 38)
                    .padding(.horizontal, 16)

                    // MARK: - Offers
                    HStack {
                        Text("Музыкально отлететь")
                            .fontTitle1()
                            .foregroundStyle(Color.noNameColors1)
                        Spacer()
                    }
                    .padding(.top, 32)
                    .padding(.horizontal, 16)

                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(viewModel.countryOffers, id: \.self) { offer in
                                CountryOfferView(offer: offer, offerImages: viewModel.offerImages)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.visible)
                    .padding(.top, 26)
                }
            }
            .background(
                Color.tsBlack
                    // .ignoresSafeArea()
            )
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

// MARK: - Preview
#Preview {
    AirTicketsStartView()
        .environmentObject(AppCoordinator())
        .environmentObject(AirTicketsVM.shared)
}
