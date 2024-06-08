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

    // MARK: - AirTicketsScreen
    // AirTicketsStartView
    case searchIcon = "SearchIcon"
    case offerIcon = "OfferIcon"
    case offer1 = "Offer1"
    case offer2 = "Offer2"
    case offer3 = "Offer3"
    case removeTextButton = "RemoveTextButton"
    case airTicketsCountryBackButton = "AirTicketsCountryBackButton"
    case swapPlaces = "SwapPlaces"
    case returnTicketFilterIcon = "ReturnTicketFilterIcon"
    case passengersFilterIcon = "PassengersFilterIcon"
    case filtersIcon = "FiltersIcon"

    // AirTicketsSearchSheet
    case closeSheetIcon = "CloseSheetIcon"
    case anywhereButton = "AnywhereButton"
    case difficultRouteButton = "DifficultRouteButton"
    case hotTicketsButton = "HotTicketsButton"
    case weekendButton = "WeekendButton"
    case airTicketsSheetFrom = "AirTicketsSheetFrom"
    case airTicketsSheetTo = "AirTicketsSheetTo"
    case destinationIstanbul = "DestinationIstanbul"
    case destinationPhuket = "DestinationPhuket"
    case destinationSochi = "DestinationSochi"

    // AirTicketsCountryView
    case ticketRedMarket = "TicketRedMarket"
    case ticketBlueMarket = "TicketBlueMarket"
    case ticketWhiteMarket = "TicketWhiteMarket"

    // AirTicketsOptionsView
    case airTicketsOptionsBackButton = "AirTicketsOptionsBackButton"
    case airTicketsOptionsChartButton = "AirTicketsOptionsChartButton"
    case priceNotification = "PriceNotification"

    // MARK: - Properties
    var image: Image {
        return Image(self.rawValue)
    }
}
