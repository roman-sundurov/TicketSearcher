//
//  HotelsView.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import SwiftUI

struct HotelsView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @StateObject var viewModel: HotelsVM

    var body: some View {
        Text("Страница \"Отели\"")
    }
}

#Preview {
    HotelsView(viewModel: HotelsVM())
}
