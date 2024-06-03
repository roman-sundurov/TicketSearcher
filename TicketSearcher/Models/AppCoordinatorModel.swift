//
//  AppCoordinatorModel.swift
//  TicketSearcher
//
//  Created by Roman on 3/6/24.
//

import Foundation

/// Use for control active screen in Coordinator
enum Screen {
    case airTickets // В Figma называется "Авиабилеты
    case hotels // В Figma называется "Отели"
    case shorter // В Figma называется "Короче"
    case notifications // В Figma называется "Подписки"
    case profile // В Figma называется "Профиль"
}

enum Sheet {
    case airTickets1Search
    case airTickets2Country
    case airTickets2Options
}
