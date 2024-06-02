//
//  AirTicketsModel.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation

// MARK: - getAirTicketsOffers
struct Offers: Decodable {
    let offers: [Offer]
}

struct Offer: Decodable, Hashable {
    static func == (lhs: Offer, rhs: Offer) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(town)
        hasher.combine(price.value)
    }

    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct Price: Decodable {
    let value: Int
}
