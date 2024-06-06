//
//  String+CharacterHelper.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import Foundation
import SwiftUI

extension String {
    func isCyrillic() -> Bool {
        for character in self where !character.isCyrillic {
            return false
        }
        return true
    }
}

extension Character {
    var isCyrillic: Bool {
        return ("А"..."я").contains(self) || self == "ё" || self == "Ё" || self == " "
    }
}
