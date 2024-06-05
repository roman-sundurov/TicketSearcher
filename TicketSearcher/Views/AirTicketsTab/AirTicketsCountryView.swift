//
//  AirTickets2CountrySheet.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import SwiftUI

struct AirTicketsCountryView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM

    var maxOfferObjects: Int {
        return viewModel.ticketOffer.count >= 3 ? 3 : viewModel.ticketOffer.count
    }

    var body: some View {
        VStack {
            HStack {
                AssetImage.airTicketCountryBackButton.image
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 8)
                
                VStack {
                    // MARK: - From block
                    HStack {
                        TextField("", text: $viewModel.from)
                            .placeholder(when: viewModel.from.isEmpty) {
                                Text("Откуда - Москва").foregroundColor(.gray)
                            }
                            .foregroundStyle(Color.white)
                            .onChange(of: viewModel.from) { oldText, newText in
                                let filtered = newText.filter { $0.isCyrillic }
                                if filtered != newText {
                                    viewModel.from = filtered
                                }
                            }
                            .onTapGesture {
                                print("Tap From fromTextField") // Using for avoid dissmis keyboard
                            }
                        
                        AssetImage.swapPlaces.image
                            .frame(width: 12, height: 12)
                            .onTapGesture {
                                let temp = viewModel.from
                                viewModel.from = viewModel.to
                                viewModel.to = temp
                            }
                    }
                    
                    
                    Divider()
                        .background(Color.tsGrey6)
                        .frame(height: 1)
                    
                    // MARK: - To block
                    HStack {
                        TextField("", text: $viewModel.to)
                            .placeholder(when: viewModel.to.isEmpty) {
                                Text("Куда - Турция").foregroundColor(.gray)
                            }
                            .foregroundStyle(Color.white)
                            .onChange(of: viewModel.to) { oldText, newText in
                                let filtered = newText.filter { $0.isCyrillic }
                                if filtered != newText {
                                    self.viewModel.to = filtered
                                }
                            }
                            .onTapGesture {
                                print("Tap From toTextField") // Using for avoid dissmis keyboard
                                viewModel.showSearchSheet = true
                            }
                        
                        if !viewModel.to.isEmpty {
                            AssetImage.removeTextButton.image
                                .frame(width: 9, height: 9)
                                .onTapGesture {
                                    viewModel.to = ""
                                }
                        }
                    }
                }
                .padding(.trailing, 22)
                .padding(.vertical, 18)
            }
            .background(
                Color.tsGrey3
            )
            .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
            .padding(.top, 47)
            
            AirTicketsFilters()
                .scrollIndicators(.hidden)
                .padding(.top, 15)
            
            VStack {
                VStack {
                    HStack {
                        Text("Прямые рейсы")
                            .fontTitle2()
                            .foregroundStyle(Color.tsWhite)

                        Spacer()
                    }
                    
                    ForEach(0..<maxOfferObjects, id: \.self) { index in
                        VStack {
                            RecommendedTicketView(
                                ticketOffer: viewModel.ticketOffer[index],
                                index: index
                            )
                            .padding(.top, 8)
                            .padding(.bottom, 10)
                         
                            if index < maxOfferObjects - 1 {
                                Divider()
                                    .background(Color.tsGrey6)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
                .padding(16)
                .padding(.vertical, 18)
            }
            .background(
                Color.tsGrey2
            )
            .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
            .padding(.top, 15)

            Button(action: {
                appCoordinator.activeScreen = .airTicketsOptions
            }, label: {
                HStack {
                    Spacer()
                    Text("Посмотреть все билеты")
                        .fontButtonText1()
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 10)
                    Spacer()
                }
            })
            .buttonStyle(BorderedButtonStyle())
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8), style: FillStyle())
            .padding(.top, 18)

            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.tsBlack)
        .onAppear {
            viewModel.getFlightData()
        }
    }
}

#Preview {
    AirTicketsCountryView()
        .environmentObject(AppCoordinator())
        .environmentObject(AirTicketsVM.shared)
}
