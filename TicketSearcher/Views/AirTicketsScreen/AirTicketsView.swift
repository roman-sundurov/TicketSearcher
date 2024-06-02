//
//  AirTicketsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct AirTicketsView: View {
    @StateObject var viewModel: AirTicketsVM
    var coordinator: AppCoordinator

    @State var from: String = ""
    @State var to: String = ""

    var body: some View {
        VStack {
            Text("Поиск дешевых авиабилетов")
                .fontTitle1()
                .foregroundStyle(Color.noNameColors1)
                .frame(width: 172)
                .multilineTextAlignment(.center)

            // MARK: - From - To block
            HStack(spacing: 0) {
                HStack(spacing: 0) {
                    AssetImage.searchIcon.image
                        .frame(width: 16, height: 16)
                        .padding(.leading, 12)
                        .padding(.trailing, 21)

                    VStack {
                        TextField("", text: $from)
                            .placeholder(when: from.isEmpty) {
                                Text("Откуда - Москва").foregroundColor(.gray)
                            }
                            .foregroundStyle(Color.white)
                        Divider()
                            .background(Color.tsGrey6)
                            .frame(height: 1)

                        TextField("", text: $to)
                            .placeholder(when: to.isEmpty) {
                                Text("Куда - Турция").foregroundColor(.gray)
                            }
                            .foregroundStyle(Color.white)
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
        .background(Color.tsBlack)
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

// #Preview {
//     AirTicketsView(viewModel: AirTicketsVM(), coordinator: AppCoordinator())
// }
