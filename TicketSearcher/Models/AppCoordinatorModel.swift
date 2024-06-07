//
//  AppCoordinatorModel.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import Foundation

/// Use for control active screen in Coordinator
enum Screen {
    case airTicketsView // В Figma называется "Авиабилеты
    case stub
    case hotels // В Figma называется "Отели"
    case shorter // В Figma называется "Короче"
    case notifications // В Figma называется "Подписки"
    case profile // В Figma называется "Профиль"
}

enum Sheet {
    case airTicketsSearch
}

enum NavigationStackScreen {
    case airTicketsStart
    case airTicketsCountry
    case airTicketsOptions
}
