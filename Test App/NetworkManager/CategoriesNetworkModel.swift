import Foundation

struct CategoryTask: Decodable {
    let id: Int
    let name: String
    let imageUrl: String
}

struct CategoriesTask: Decodable {
    let сategories: [CategoryTask]
}
