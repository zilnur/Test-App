import Foundation

struct Categories: Decodable {
    let id: Int
    let name: String
    let imageUrl: String
}

struct CategoriesTask: Decodable {
    let сategories: [Categories]
}
