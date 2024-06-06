//
//  TabBarModel.swift
//  TicketSearcher
//
//  Created by Roman on 31/5/24.
//

import Foundation
import SwiftUI

struct TabBarButtonDetails: Hashable {
    var text: String
    var iconName: String
    var screen: Screen

    var icon: Image {
        Image(iconName)
    }
}
