//
//  CategoriesViewModel.swift
//  Test App
//
//  Created by Ильнур Закиров on 30.06.2023.
//

import Foundation
import Combine

class CategoriesViewModel: ObservableObject {
    
    let networkManager = NetworkManager()
    
    @Published var model: [Category] = []
    
    var subscriber = Set<AnyCancellable>()
    
    init() {
        setModel()
    }
    
    func setModel() {
        networkManager.makeCategoriesRequest(model: CategoriesTask.self, path: .categories)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { task in
                task.сategories.forEach { [weak self] categori in
                    guard let self else { return }
                    let category = Category(id: categori.id, name: categori.name, imageUrl: categori.imageUrl)
                    self.model.append(category)
                }
            }
            .store(in: &subscriber)
    }
}
