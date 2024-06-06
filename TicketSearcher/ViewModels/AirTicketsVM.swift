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

    // API requests' data
    @Published var countryOffers: [CountryOffers] = []
    @Published var ticketOffers: [TicketOffer] = []
    @Published var detailedTickets: [DetailedTicket] = []
    @Published var errorMessage: String?
    @Published var showSearchSheet = false

    // AirTicketsFilters
    @Published var backDate: Date = Date.init(timeIntervalSince1970: 0) // Back way
    @Published var showBackDatePicker = false // Back way

    @Published var thereDate: Date = .now // There way
    @Published var showThereDatePicker = false // There way

    /// Using in StubView for the testing purpose
    @Published var stubViewScreenName = ""

    @AppStorage("fromCity")
    var fromCity: String = ""
    @AppStorage("toCity")
    var toCity: String = ""

    var networkService = NetworkService.shared

    var offerImages: [Int: Image] = [
        1: AssetImage.offer1.image,
        2: AssetImage.offer2.image,
        3: AssetImage.offer3.image
    ]

    init() {
        getOffersData()
    }

    // MARK: - API requests' handling
    func getOffersData() {
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
                    self?.ticketOffers = response.ticketsOffers
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func getDetailedFlightData() {
        networkService.getFlightDetail { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.detailedTickets = response.detailedTickets
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }


    func anywhereButton() {
        toCity = "Куда угодно"
    }

    func getDayMonthWeekdayFormat(date: Date) -> (dayMonth: String, weekday: String) {
        let components = Calendar.current.dateComponents([.day, .month, .weekday], from: date)
        let day = components.day ?? 0
        let month = date.formatted(.dateTime.month(.wide).locale(Locale(identifier: "ru_RU")))
        let weekday = date.formatted(.dateTime.weekday(.short).locale(Locale(identifier: "ru_RU")))
        return ("\(day) \(month)", weekday.lowercased())
    }

    /// dateString should be in the format of "2024-02-23T04:00:00"
    func getTime1970(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            return nil
        }
    }

    func getHoursTimeIntervalForFlight(from startDate: Date, to endDate: Date) -> String {
        let interval = endDate.timeIntervalSince(startDate)
        let hours = interval / 3600.0
        let formattedString = String(format: "%.1f", hours)
        return formattedString
    }
}
