//
//  FontHelper.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
import SwiftUI

public extension Text {
    func fontTitle1() -> some View {
        self.font(FontHelper.customFont(size: 22, weight: .semibold))
    }

    func fontTitle2() -> some View {
        self.font(FontHelper.customFont(size: 20, weight: .semibold))
    }

    func fontTitle3() -> some View {
        self.font(FontHelper.customFont(size: 16, weight: .medium))
    }

    func fontTitle4() -> some View {
        self.font(FontHelper.customFont(size: 14, weight: .regular))
    }

    func fontText1() -> some View {
        self.font(FontHelper.customFont(size: 16, weight: .regular))
    }

    func fontText2() -> some View {
        self.font(FontHelper.customFont(size: 14, weight: .semibold))
    }

    func fontButtonText1() -> some View {
        self.font(FontHelper.customFont(size: 16, weight: .regular))
    }

    func fontTabText() -> some View {
        self.font(FontHelper.customFont(size: 10, weight: .regular))
    }
}

struct FontHelper {
    static func customFont(size: CGFloat, weight: Font.Weight) -> Font {
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
