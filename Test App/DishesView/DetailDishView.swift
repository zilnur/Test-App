//
//  DetailDishView.swift
//  Test App
//
//  Created by Ильнур Закиров on 02.07.2023.
//

import SwiftUI

struct DetailDishView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var dish: Dish
    @Binding var isPresent: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            image()
            
            Text(dish.name)
            
            HStack(spacing: 0) {
                Text(dish.price.formatted() + " ₽")
                Text("﹒")
                Text(dish.weight.formatted() + "г")
            }
            
            Text(dish.description)
            
            Button {
                save(dish: dish)
                withAnimation {
                    isPresent = false
                }
            } label: {
                Text("Добавить в корзину")
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
            }
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("blue"))
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
        .background(.white, in: RoundedRectangle(cornerRadius: 15))
        .padding()
    }
    
    @ViewBuilder
    func image() -> some View {
        if isPresent {
            AsyncImage(url: URL(string: dish.imageUrl), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    ProgressView()
                })
                .frame(maxWidth: .infinity)
                .background(Color("background"),
                            in: RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .topTrailing) {
                    HStack {
                        Spacer()
                        ForEach(["heart","xmark"], id: \.self) { image in
                            Button {
                                if image == "xmark" {
                                    withAnimation {
                                        isPresent = false
                                    }
                                }
                            } label: {
                                Image(systemName: image)
                                    .frame(width: 24, height: 24)
                                    .padding(10)
                                    .background(.white, in: RoundedRectangle(cornerRadius: 8))
                                    .foregroundColor(.black)
                            }

                        }
                    }
                    .padding(8)
                }
            .padding(.top)
        }
    }
    
    func save(dish: Dish) {
        let request = SavedDish.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", dish.name)
        
        if let dish_ = try? viewContext.fetch(request).first {
            return
        } else {
            let savedDish = SavedDish(context: viewContext)
            savedDish.id = dish.id
            savedDish.name = dish.name
            savedDish.imageUrl = dish.imageUrl
            savedDish.price = dish.price
            savedDish.weight = dish.weight
            savedDish.count = 1
            viewContext.saveDish()
        }
    }
}

struct DetailDishView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
