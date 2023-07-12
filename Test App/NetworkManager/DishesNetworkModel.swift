import Foundation

struct DishTask: Decodable {
    let id: Int16
    let name: String
    let price: Int16
    let weight: Int16
    let description: String
    let imageUrl: String
    let tegs: [String]
}

struct DishesTask: Decodable {
    let dishes: [DishTask]
}
