//
//  CategoriesView.swift
//  Test App
//
//  Created by Ильнур Закиров on 01.07.2023.
//

import SwiftUI

struct CategoriesView: View {

    @ObservedObject var viewModel = CategoriesViewModel()
    @State var selectedCategories = ""
    @State var isPresented = false
    
    var body: some View {
//        VStack {
//            CustomNavigationView(isPresented: $isPresented, selectedCategory: $selectedCategories)
//                .padding(.horizontal)
            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach($viewModel.model) { cat in
                            NavigationLink {
                                DishesView(category: cat.name.wrappedValue)
                                
                            } label: {
                                CategoryView(category: cat)
                            }
                        }
                    }
                }
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
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
