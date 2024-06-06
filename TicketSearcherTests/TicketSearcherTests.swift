//
//  TicketSearcherTests.swift
//  TicketSearcherTests
//
//  Created by Roman on 31/5/24.
//

import XCTest
@testable import TicketSearcher

final class TicketSearcherTests: XCTestCase {
    var networkService = NetworkService()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetAirTicketsOffers() throws {
        networkService.getAirTicketsOffers { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }

    func testGetFlightData() throws {
        networkService.getFlightToCountry { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }

    func testGetDetailedFlightData() throws {
        networkService.getFlightDetail { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
}
