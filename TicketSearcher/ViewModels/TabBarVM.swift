//
//  TabBarVM.swift
//  TicketSearcher
//
//  Created by Roman on 1/6/24.
//

import Foundation
import SwiftUI

class TabBarVM: ObservableObject {
    @Published var activeScreen: Screen
    var buttonsDetails: [TabBarButtonDetails] = []

    init(activeScreen: Screen) {
        self.activeScreen = activeScreen
        self.buttonsDetails = [
            TabBarButtonDetails(
                text: "Авиабилеты",
                iconName: activeScreen == .airTickets ? AssetImage.airTicketsTabBarActive.rawValue : AssetImage.airTicketsTabBarNotActive.rawValue,
                screen: .airTickets
            ),
            TabBarButtonDetails(
                text: "Отели",
                iconName: activeScreen == .hotels ? AssetImage.hotelTabBarActive.rawValue : AssetImage.hotelTabBarNotActive.rawValue,
                screen: .hotels
            ),
            TabBarButtonDetails(
                text: "Короче",
                iconName: activeScreen == .shorter ? AssetImage.shorterTabBarActive.rawValue : AssetImage.shorterTabBarNotActive.rawValue,
                screen: .shorter
            ),
            TabBarButtonDetails(
                text: "Подписки",
                iconName: activeScreen == .notifications ? AssetImage.notificationsTabBarActive.rawValue : AssetImage.notificationsTabBarNotActive.rawValue,
                screen: .notifications
            ),
            TabBarButtonDetails(
                text: "Профили",
                iconName: activeScreen == .profile ? AssetImage.profileTabBarActive.rawValue : AssetImage.profileTabBarNotActive.rawValue,
                screen: .profile
            )
        ]
    }
}
