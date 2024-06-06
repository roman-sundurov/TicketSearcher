//
//  CountryOfferView.swift
//  TicketSearcher
//
//  Created by Roman on 2/6/24.
//

import SwiftUI

struct CountryOfferView: View {
    var offer: CountryOffers
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
                .foregroundStyle(Color.tsWhite)
                .padding(.top, 8)
            Text(offer.town)
                .fontText2()
                .foregroundStyle(Color.tsWhite)
                .padding(.top, 8)
            HStack(spacing: 0) {
                AssetImage.offerIcon.image
                    .frame(width: 17, height: 17)
                Text("от \(offer.price.value.priceformatNumber())")
                    .fontText2()
                    .foregroundStyle(Color.tsWhite)
                    .padding(.leading, 4)
            }
            .padding(.top, 4)
        }
        .frame(width: 132, height: 214)
    }
}

var testOffer = CountryOffers(
    id: 1,
    title: "Test title",
    town: "Test town",
    price: Price(value: 1234)
)

var airTicketsVM = AirTicketsVM()

#Preview {
    VStack {
        CountryOfferView(offer: testOffer, offerImages: airTicketsVM.offerImages)
    }
    .background(Color.tsBlack)
}
