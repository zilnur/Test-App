//
//  SwiftUIView.swift
//  Test App
//
//  Created by Ильнур Закиров on 03.07.2023.
//

import SwiftUI

import SwiftUI

struct ContentqView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail")
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct ContentqView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentqView()
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationBarTitle("Detail")
    }
}
