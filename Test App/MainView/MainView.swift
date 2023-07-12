//
//  MainView.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Tabs = .main
    
    var body: some View {
        
        VStack {
            TabView(selection: $selectedTab) {
                CategoriesView()
                    .tag(Tabs.main)
                    .toolbar(.hidden, for: .tabBar)
                Text("Hi")
                    .tag(Tabs.search)
                    .toolbar(.hidden, for: .tabBar)
                BasketView()
                    .tag(Tabs.basket)
                    .toolbar(.hidden, for: .tabBar)
                Text("Hi")
                    .tag(Tabs.profile)
                    .toolbar(.hidden, for: .tabBar)
            }
            HStack {
                ForEach(Tabs.allCases, id: \.rawValue) { tab in
                    CustomTabItem(tab: tab, selectedTab: $selectedTab)
                }
            }
            .padding([.horizontal, .bottom])
            .background(.white, in: Rectangle())
            
        }
        .ignoresSafeArea()
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
