//
//  NetworkService.swift
//  TicketSearcher
//
//  Created by Roman on 2/6/24.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()

    func getAirTicketsOffers(completion: @escaping (Result<Offers, AFError>) -> Void) {
        let url = "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd"

        AF.request(url)
            .validate()
            .responseDecodable(of: Offers.self) { response in
                switch response.result {
                case .success(let offers):
                    print("getAirTicketsOffers= \(offers)")
                    completion(.success(offers))
                case .failure(let error):
                    print("error getAirTicketsOffers= \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
}
