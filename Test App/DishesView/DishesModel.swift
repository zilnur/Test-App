//
//  DishesModel.swift
//  Test App
//
//  Created by Ильнур Закиров on 02.07.2023.
//

import Foundation

struct Dish: Identifiable {
    let id: Int16
    let name: String
    let price: Int16
    let weight: Int16
    let description: String
    let imageUrl: String
    let tegs: [String]
    
    init(id: Int16 = 0, name: String = "", price: Int16 = 0, weight: Int16 = 0, description: String = "", imageUrl: String = "", tegs: [String] = []) {
        self.id = id
        self.name = name
        self.price = price
        self.weight = weight
        self.description = description
        self.imageUrl = imageUrl
        self.tegs = tegs
    }
}
