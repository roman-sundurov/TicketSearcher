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

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct ConditionalPaddingModifier: ViewModifier {
    var condition: Bool
    var padding: Edge.Set
    var value: CGFloat

    func body(content: Content) -> some View {
        if condition {
            return AnyView(content.padding(padding, value))
        } else {
            return AnyView(content)
        }
    }
}
