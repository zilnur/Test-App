//
//  CustomTabItem.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import SwiftUI

struct CustomTabItem: View {
    
    var tab: Tabs
    @Binding var selectedTab: Tabs
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 0) {
                Image(tab.image)
                    .colorMultiply(selectedTab == tab ? Color("blue") : .gray)
                Text(tab.rawValue)
                    .font(Font.custom("SF Pro Display", size: 10).weight(.medium))
            }
            .foregroundColor(selectedTab == tab ? Color("blue") : .gray)
        }
        .frame(maxWidth: .infinity, maxHeight: 70)
        
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
