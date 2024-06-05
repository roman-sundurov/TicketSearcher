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

// MARK: - getFlightDetail
struct DetailedTicketResponse: Decodable {
    let detailedTickets: [DetailedTicket]

    enum CodingKeys: String, CodingKey {
        case detailedTickets = "tickets"
    }
}

struct DetailedTicket: Decodable {
    let id: Int
    let badge: String?
    let price: Price
    let providerName: String
    let company: String
    let departure: FlightDetail
    let arrival: FlightDetail
    let hasTransfer: Bool
    let hasVisaTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable: Bool
    let isExchangable: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case badge
        case price
        case providerName = "provider_name"
        case company
        case departure
        case arrival
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case luggage
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }
}

struct FlightDetail: Decodable {
    let town: String
    let date: String
    let airport: String
}

struct Luggage: Decodable {
    let hasLuggage: Bool
    let price: Price?

    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}

struct HandLuggage: Decodable {
    let hasHandLuggage: Bool
    let size: String?

    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}
