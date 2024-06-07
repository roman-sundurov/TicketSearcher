//
//  StringHelper.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import Foundation

extension Int {
    func priceformatNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.secondaryGroupingSize = 2

        if let outpur = numberFormatter.string(from: NSNumber(value: self)) {
            return outpur
        } else {
            return ""
        }
    }
}
