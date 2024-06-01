//
//  HotelsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct HotelsView: View {
    @StateObject var viewModel: HotelsVM
    var coordinator: AppCoordinator

    var body: some View {
        Text("Страница \"Отели\"")
    }
}

#Preview {
    HotelsView(viewModel: HotelsVM(), coordinator: AppCoordinator())
}
