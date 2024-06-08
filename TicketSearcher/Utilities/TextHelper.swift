//
//  FontHelper.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
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

public extension Text {
    func fontTitle1() -> some View {
        self.font(tsCustomFont(size: 22, weight: .semibold))
    }

    func fontTitle2() -> some View {
        self.font(tsCustomFont(size: 20, weight: .semibold))
    }

    func fontTitle3() -> some View {
        self.font(tsCustomFont(size: 16, weight: .medium))
    }

    func fontTitle4() -> some View {
        self.font(tsCustomFont(size: 14, weight: .regular))
    }

    func fontText1() -> some View {
        self.font(tsCustomFont(size: 16, weight: .regular))
    }

    func fontText2() -> some View {
        self.font(tsCustomFont(size: 14, weight: .semibold))
    }

    func fontButtonText1() -> some View {
        self.font(tsCustomFont(size: 16, weight: .semibold))
    }

    func fontTabText() -> some View {
        self.font(tsCustomFont(size: 10, weight: .regular))
    }

    func tsCustomFont(size: CGFloat, weight: Font.Weight) -> Font {
        return Font.system(size: size, weight: weight, design: .default)
    }
}

public extension Text {
    func fontRoutOptionsButton() -> some View {
        self
            .fontText2()
            .foregroundStyle(Color.tsWhite)
            .multilineTextAlignment(.center)
    }
}
