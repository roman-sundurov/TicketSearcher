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
    @Published var offers: [Offer] = []
    @Published var errorMessage: String?

    var networkService = NetworkService.shared

    var offerImages: [Int: Image] = [
        1: AssetImage.offer1.image,
        2: AssetImage.offer2.image,
        3: AssetImage.offer3.image
    ]

    init() {
        // TODO: - Add fetchData function
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

    // TODO: - Add fetchData function
}
