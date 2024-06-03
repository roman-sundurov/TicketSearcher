//
//  AirTicketsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct AirTicketsView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM
    // @StateObject var viewModel: AirTicketsVM

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

                                    if !viewModel.from.isEmpty {
                                        AssetImage.removeTextButton.image
                                            .frame(width: 9, height: 9)
                                            .onTapGesture {
                                                viewModel.from = ""
                                            }
                                    }
                                }


                                Divider()
                                    .background(Color.tsGrey6)
                                    .frame(height: 1)

                                // MARK: - To block
                                HStack {
                                    // I commented on the TextFiled and used the Text below because the technical task says the modal window should open after the user taps the destination field.
                                
                                    // TextField("", text: $to)
                                    //     .placeholder(when: to.isEmpty) {
                                    //         Text("Куда - Турция").foregroundColor(.gray)
                                    //     }
                                    //     .foregroundStyle(Color.white)
                                    //     .onChange(of: to) { text in
                                    //         let filtered = text.filter { $0.isCyrillic }
                                    //         if filtered != text {
                                    //             self.to = filtered
                                    //         }
                                    //     }
                                    //     .onTapGesture {
                                    //         print("Tap From toTextField") // Using for avoid dissmis keyboard
                                    //         showSearchSheet = true
                                    //     }
                                
                                    Text(viewModel.to)
                                        .placeholder(when: viewModel.to.isEmpty) {
                                            Text("Куда - Турция").foregroundColor(.gray)
                                        }
                                        .foregroundStyle(Color.white)
                                        .onTapGesture {
                                            print("Tap From toTextField") // Using for avoid dissmis keyboard
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            // viewModel.showSearchSheet = true
                                            appCoordinator.activeSheet = .airTickets1Search
                                        }

                                    Spacer(minLength: 0)
                                
                                    if !viewModel.to.isEmpty {
                                        AssetImage.removeTextButton.image
                                            .frame(width: 9, height: 9)
                                            .onTapGesture {
                                                viewModel.to = ""
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
                            ForEach(viewModel.offers, id: \.self) { offer in
                                OfferView(offer: offer, offerImages: viewModel.offerImages)
                            }
                        }
                    }
                    .scrollIndicators(.visible)
                    .padding(.top, 26)

                    Spacer()
                }
            }
            .background(
                Color.tsBlack
                    // .ignoresSafeArea()
            )
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        // }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#Preview {
    AirTicketsView()
}
