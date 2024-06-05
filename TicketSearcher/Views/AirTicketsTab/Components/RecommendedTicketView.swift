//
//  RecommendedTicketView.swift
//  TicketSearcher
//
//  Created by Roman on 4/6/24.
//

import SwiftUI

struct RecommendedTicketView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    // @EnvironmentObject var viewModel: AirTicketsVM

    var ticketOffer: TicketOffer
    var index: Int?

    var body: some View {
        let combinedString = ticketOffer.timeRange.joined(separator: " ")
        HStack {
            if let image = getMarkerColor(index) {
                image
            }
            VStack(spacing: 4) {
                HStack {
                    Text(ticketOffer.title)
                        .fontTitle4()
                        .foregroundStyle(Color.tsWhite)
                    Spacer()
                    Text(ticketOffer.price.value.priceformatNumber() + " ₽")
                        .fontTitle4()
                        .foregroundStyle(Color.tsBlue)
                }
                HStack {
                    Text(combinedString)
                        .fontText2()
                        .foregroundStyle(Color.tsWhite)
                        .lineLimit(1)
                    Spacer()
                }
            }
        }
    }

    func getMarkerColor(_ iterationNumber: Int?) -> Image? {
        switch iterationNumber {
        case 0:
            return AssetImage.ticketRedMarket.image
        case 1:
            return AssetImage.ticketBlueMarket.image
        case 2:
            return AssetImage.ticketWhiteMarket.image
        default:
            return nil
        }
    }
}

// MARK: - Preview
var previewTicketOffer = TicketOffer(
    id: 1,
    title: "Test ticket",
    timeRange: ["10:00", "12:30", "19:15"],
    price: Price(value: 27990)
)
#Preview {
    VStack {
        RecommendedTicketView(ticketOffer: previewTicketOffer, index: 1)
            .environmentObject(AppCoordinator())
        // .environmentObject(AirTicketsVM())
    }
    .background(Color.black)
}
