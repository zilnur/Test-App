//
//  DishCard.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import SwiftUI

struct DishCard: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var dish: SavedDish
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: dish.imageUrl_), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            }) {
                ProgressView()
            }
            .padding(8)
            .background(Color("background"), in: RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading) {
                Text(dish.name_)
                    .font(Font.custom("SF Pro Display", size: 14))
                HStack(spacing: 0) {
                    Text(dish.price.formatted() + " ₽")
                        .font(Font.custom("SF Pro Display", size: 14))
                    Text("﹒" + dish.weight.formatted() + "г")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            HStack(spacing: 16) {
                Button {
                    dish.count -= 1
                } label: {
                    Text("-")
                        .foregroundColor(.black)
                }
                .onChange(of: dish.count) { newValue in
                    if newValue == 0 {
                        deleteDish()
                    } else {
                        viewContext.saveDish()
                    }
                }
                Text("\(dish.count)")
                Button {
                    dish.count += 1
                } label: {
                    Text("+")
                        .foregroundColor(.black)
                }
                .onChange(of: dish.count) { newValue in
                    viewContext.saveDish()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(Color("background"), in: RoundedRectangle(cornerRadius: 10))
        }
    }
    
    func deleteDish() {
        viewContext.delete(dish)
        viewContext.saveDish()
    }
}

struct DishCard_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
