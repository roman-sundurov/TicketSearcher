//
//  ImageHelper.swift
//  TicketSearcher
//
//  Created by Roman on 1/6/24.
//

import Foundation
import SwiftUI

enum AssetImage: String {
    // MARK: - TabBar icons
    case airTicketsTabBarActive = "AirTicketsTabBarActive"
    case airTicketsTabBarNotActive = "AirTicketsTabBarNotActive"

    case hotelTabBarActive = "HotelTabBarActive"
    case hotelTabBarNotActive = "HotelTabBarNotActive"

    case notificationsTabBarActive = "NotificationsTabBarActive"
    case notificationsTabBarNotActive = "NotificationsTabBarNotActive"

    case profileTabBarActive = "ProfileTabBarActive"
    case profileTabBarNotActive = "ProfileTabBarNotActive"

    case shorterTabBarActive = "ShorterTabBarActive"
    case shorterTabBarNotActive = "ShorterTabBarNotActive"

    var image: Image {
        return Image(self.rawValue)
    }
}
