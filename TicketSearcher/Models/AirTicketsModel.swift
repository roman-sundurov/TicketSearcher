//
//  AirTicketsModel.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation

struct Offer: Codable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct Price: Codable {
    let value: Int
}
