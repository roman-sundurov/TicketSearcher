//
//  AirTicketsVM.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
import Alamofire
import SwiftUI

class AirTicketsVM: ObservableObject {
    static var shared = AirTicketsVM()

    @Published var offers: [Offer] = []
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
                    self?.offers = response.offers
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
}
