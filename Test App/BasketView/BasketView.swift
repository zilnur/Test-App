//
//  BasketView.swift
//  Test App
//
//  Created by Ильнур Закиров on 02.07.2023.
//

import SwiftUI

struct BasketView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SavedDish.name, ascending: true)], animation: .default)
    var dishes: FetchedResults<SavedDish>
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(dishes) { dish in
                            DishCard(dish: dish)
                                .padding(.horizontal)
                        }
                    }
                }
                Button {
                    
                } label: {
                    Text("Оплатить " + dishesSum().formatted())
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("blue"), in: RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
            }
            .toolbar(.visible, for: .navigationBar)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(alignment: .top) {
                        Image("pin")
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Санкт-петербург")
                                .font(.custom("SF Pro Display", size: 18).weight(.medium))
                            Text(dateToString(date: .init()))
                                .font(Font.custom("SF Pro Display", size: 14))
                                .foregroundColor(.black.opacity(0.5))
                        }
                        Spacer()
                    }
                }
                ToolbarItem {
                    Image("userPhoto")
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .center)
                        .clipShape(Circle())
                }
            }
        }
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, YYYY"
        formatter.locale = Locale(identifier: "ru_Ru")
        let string = formatter.string(from: date).capitalized
        return string
    }
    
    func dishesSum() -> Int {
        var sum = 0
        dishes.forEach { dish in
            let dishSum = dish.price * dish.count
            sum += Int(dishSum)
        }
        return sum
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
