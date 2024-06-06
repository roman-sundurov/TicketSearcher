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

    /// Using on the AirTicketsStartView
    func getAirTicketsOffers(completion: @escaping (Result<CountryOffersResponse, AFError>) -> Void) {
        let url = "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd"

        AF.request(url)
            .validate()
            .responseDecodable(of: CountryOffersResponse.self) { response in
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

    /// Using on the AirTicketsCountryView
    func getFlightToCountry(completion: @escaping (Result<TicketOffersResponse, AFError>) -> Void) {
        let url = "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017"

        AF.request(url)
            .validate()
            .responseDecodable(of: TicketOffersResponse.self) { response in
                switch response.result {
                case .success(let offers):
                    print("getFlightToCountry= \(offers)")
                    completion(.success(offers))
                case .failure(let error):
                    print("error getFlightToCountry= \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }

    /// Using on the AirTicketDetailView
    func getFlightDetail(completion: @escaping (Result<DetailedTicketResponse, AFError>) -> Void) {
        let url = "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf"

        AF.request(url)
            .validate()
            .responseDecodable(of: DetailedTicketResponse.self) { response in
                switch response.result {
                case .success(let offers):
                    print("getFlightDetail= \(offers)")
                    completion(.success(offers))
                case .failure(let error):
                    print("error getFlightDetail= \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
}
