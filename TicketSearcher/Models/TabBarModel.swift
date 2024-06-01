//
//  TabBarModel.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
import SwiftUI

/// Use for control active screen in Coordinator
enum Screen {
    case airTickets // В Figma называется "Авиабилеты
    case hotels // В Figma называется "Отели"
    case shorter // В Figma называется "Короче"
    case notifications // В Figma называется "Подписки"
    case profile // В Figma называется "Профиль"
}

struct TabBarButtonDetails: Hashable {
    var text: String
    var iconName: String
    var screen: Screen

    var icon: Image {
        Image(iconName)
    }
}
