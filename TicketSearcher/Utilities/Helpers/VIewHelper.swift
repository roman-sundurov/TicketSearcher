//
//  VIewHelper.swift
//  TicketSearcher
//
//  Created by Roman on 5/6/24.
//

import SwiftUI

/// Using for measure height of view
struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}
