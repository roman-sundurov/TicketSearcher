//
//  AirTicketsModel.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
// File presents models for the AirTicketsStartView screen and the AirTicketsCountryView

// MARK: - getAirTicketsOffers
struct CountryOffersResponse: Decodable {
    let offers: [CountryOffers]
}

struct CountryOffers: Decodable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

extension CountryOffers: Hashable {
    static func == (lhs: CountryOffers, rhs: CountryOffers) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(town)
        hasher.combine(price.value)
    }
}

struct Price: Decodable {
    let value: Int
}

// MARK: - getFlightToCountry
struct TicketOffersResponse: Decodable {
    let ticketsOffers: [TicketOffer]

    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

struct TicketOffer: Decodable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case timeRange = "time_range"
        case price
    }
}

extension TicketOffer: Hashable {
    static func == (lhs: TicketOffer, rhs: TicketOffer) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(timeRange)
        hasher.combine(price.value)
    }
}
