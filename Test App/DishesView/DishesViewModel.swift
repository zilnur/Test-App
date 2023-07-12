//
//  DishesViewModel.swift
//  Test App
//
//  Created by Ильнур Закиров on 02.07.2023.
//

import Foundation
import Combine

class DishesViewModel: ObservableObject {
    
    let service = NetworkManager()
    @Published var model: [Dish] = []
    var subscriber = Set<AnyCancellable>()
    
    init() {
        setModel()
    }
    
    var selectedTeg: String {
        allTegs().first!
    }
    
    func setModel() {
        service.makeCategoriesRequest(model: DishesTask.self, path: .dishes)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: {  dishes in
                dishes.dishes.forEach { [weak self] dish in
                    guard let self else {
                        print("ooops")
                        return
                    }
                    let newDish = Dish(id: dish.id,
                                       name: dish.name,
                                       price: dish.price,
                                       weight: dish.weight,
                                       description: dish.description,
                                       imageUrl: dish.imageUrl,
                                       tegs: dish.tegs)
                    self.model.append(newDish)
                }
            }
            .store(in: &subscriber)
    }
    
    func allTegs() -> [String] {
        var tegs = [String]()
        model.forEach { dish in
            tegs.append(contentsOf: dish.tegs)
        }
        return Array(Set(tegs)).sorted()
    }
    
}
