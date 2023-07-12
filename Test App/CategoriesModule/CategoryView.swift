//
//  CategoryView.swift
//  Test App
//
//  Created by Ильнур Закиров on 01.07.2023.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding var category: Category
    
    var body: some View {
            AsyncImage(url: URL(string: category.imageUrl)) { image in
                image.image?
                    .resizable()
                    .frame(height: 148)
            }
            .overlay(alignment: .topLeading) {
                GeometryReader { proxy in
                    Text(category.name)
                        .font(.custom("SF Pro Display", size: 20).weight(.medium))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .top])
                        .frame(width: proxy.size.width / 2, alignment: .leading)
                }
            }
        .padding(.horizontal)

    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
