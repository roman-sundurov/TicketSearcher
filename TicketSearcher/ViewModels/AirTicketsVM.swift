//
//  AirTicketsVM.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
import Alamofire
import SwiftUI

/// ViewModel using in the AirTicketsStartView screen and the AirTicketsCountryViewa
class AirTicketsVM: ObservableObject {
    static let shared = AirTicketsVM()

    @Published var countryOffers: [CountryOffers] = []
    @Published var ticketOffer: [TicketOffer] = []
    @Published var errorMessage: String?

    @Published var from: String = ""
    @Published var to: String = ""
    @Published var showSearchSheet = false

    var networkService = NetworkService.shared

    var offerImages: [Int: Image] = [
        1: AssetImage.offer1.image,
        2: AssetImage.offer2.image,
        3: AssetImage.offer3.image
    ]

    init() {
        networkService.getAirTicketsOffers { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.countryOffers = response.offers
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func getFlightData() {
        networkService.getFlightToCountry { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.ticketOffer = response.ticketsOffers
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func anywhereButton() {
        to = "Куда угодно"
    }

    func getDayMonthWeekdayFormat(date: Date) -> (dayMonth: String, weekday: String) {
        let components = Calendar.current.dateComponents([.day, .month, .weekday], from: date)
        let day = components.day ?? 0
        let month = date.formatted(.dateTime.month(.wide).locale(Locale(identifier: "ru_RU")))
        let weekday = date.formatted(.dateTime.weekday(.short).locale(Locale(identifier: "ru_RU")))
        return ("\(day) \(month)", weekday.lowercased())
    }
}
