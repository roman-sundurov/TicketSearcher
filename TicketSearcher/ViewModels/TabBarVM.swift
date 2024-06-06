//
//  TabBarVM.swift
//  TicketSearcher
//
//  Created by Roman on 1/6/24.
//

import Foundation
import SwiftUI

class TabBarVM: ObservableObject {
    var activeScreen: Screen
    var buttonsDetails: [TabBarButtonDetails] = []

    init(activeScreen: Screen) {
        self.activeScreen = activeScreen
        self.buttonsDetails = [
            TabBarButtonDetails(
                text: "Авиабилеты",
                iconName: screenTabBarMatch(screen: activeScreen) == .airTicketsStart ? AssetImage.airTicketsTabBarActive.rawValue : AssetImage.airTicketsTabBarNotActive.rawValue,
                screen: .airTicketsStart
            ),
            TabBarButtonDetails(
                text: "Отели",
                iconName: screenTabBarMatch(screen: activeScreen) == .hotels ? AssetImage.hotelTabBarActive.rawValue : AssetImage.hotelTabBarNotActive.rawValue,
                screen: .hotels
            ),
            TabBarButtonDetails(
                text: "Короче",
                iconName: screenTabBarMatch(screen: activeScreen) == .shorter ? AssetImage.shorterTabBarActive.rawValue : AssetImage.shorterTabBarNotActive.rawValue,
                screen: .shorter
            ),
            TabBarButtonDetails(
                text: "Подписки",
                iconName: screenTabBarMatch(screen: activeScreen) == .notifications ? AssetImage.notificationsTabBarActive.rawValue : AssetImage.notificationsTabBarNotActive.rawValue,
                screen: .notifications
            ),
            TabBarButtonDetails(
                text: "Профили",
                iconName: screenTabBarMatch(screen: activeScreen) == .profile ? AssetImage.profileTabBarActive.rawValue : AssetImage.profileTabBarNotActive.rawValue,
                screen: .profile
            )
        ]
    }

    /// Returns the associated active TabBar Screen
    func screenTabBarMatch(screen: Screen) -> Screen {
        switch screen {
        case Screen.airTicketsCountry, Screen.airTicketsOptions:
            return Screen.airTicketsStart
        default:
            return screen
        }
    }
}
