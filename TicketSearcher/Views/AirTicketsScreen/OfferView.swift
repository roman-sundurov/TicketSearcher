//
//  OfferView.swift
//  TicketSearcher
//
//  Created by Roman on 2/6/24.
//

import SwiftUI

struct OfferView: View {
    var offer: Offer
    var offerImages: [Int: Image]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            if let image = offerImages[offer.id] {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
            } else {
                ProgressView()
            }
            Text(offer.title)
                .fontTitle3()
                .foregroundStyle(Color.tsGrey8)
                .padding(.top, 8)
            Text(offer.town)
                .fontText2()
                .foregroundStyle(Color.tsGrey8)
                .padding(.top, 8)
            HStack(spacing: 0) {
                AssetImage.offerIcon.image
                    .frame(width: 17, height: 17)
                Text("от \(offer.price.value.priceformatNumber())")
                    .fontText2()
                    .foregroundStyle(Color.tsGrey8)
                    .padding(.leading, 4)
            }
            .padding(.top, 4)
        }
        .frame(width: 132, height: 214)
    }
}

var testOffer = Offer(
    id: 1,
    title: "Test title",
    town: "Test town",
    price: Price(value: 1234)
)

var airTicketsVM = AirTicketsVM()

#Preview {
    VStack {
        OfferView(offer: testOffer, offerImages: airTicketsVM.offerImages)
    }
    .background(Color.tsBlack)
}
