//
//  TabModel.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import SwiftUI

enum Tabs: String, CaseIterable {
    case main = "Главная"
    case search = "Поиск"
    case basket = "Корзина"
    case profile = "Аккаунт"
    
    var image: String {
        switch self {
        case .main:
            return "main"
        case .search:
            return "search"
        case .basket:
            return "basket"
        case .profile:
            return "account"
        }
    }
    
    var index: Int {
        return Tabs.allCases.firstIndex(of: self) ?? 0
    }
}
