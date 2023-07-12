//
//  DishesView.swift
//  Test App
//
//  Created by Ильнур Закиров on 02.07.2023.
//

import SwiftUI

struct DishesView: View {
    @Environment(\.presentationMode) var present
    @ObservedObject var viewModel = DishesViewModel()
    
    var category: String
    
    @State var selectedTeg: String = ""
    @State var selectedDish: Dish = Dish()
    @State var isPresent = false
    
    var columns = [GridItem(spacing: 8),GridItem(spacing: 8),GridItem()]
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                ScrollView(.horizontal) {
                    tegsView()
                }
                ScrollView {
                    dishView()
                }
            }
            .overlay {
                Rectangle()
                    .opacity(isPresent ? 0.4 : 0)
                    .ignoresSafeArea()
            }
            VStack {
                if isPresent {
                    DetailDishView(dish: $selectedDish, isPresent: $isPresent)
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .toolbar(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    Button {
                        present.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text(category)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("userPhoto")
                    .resizable()
                    .frame(width: 44, height: 44, alignment: .center)
                    .clipShape(Circle())
            }
        }
        .onAppear {
            selectedTeg = viewModel.selectedTeg
        }
    }
    
    @ViewBuilder
    func tegsView() -> some View {
        HStack {
            ForEach(viewModel.allTegs(), id: \.self) { teg in
                Button {
                    withAnimation {
                        selectedTeg = teg
                    }
                } label: {
                    Text(teg)
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(teg == selectedTeg ? Color("blue") : Color("background"),
                                    in: RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func dishView() -> some View {
            GeometryReader { proxy in
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.model.filter {$0.tegs.contains {$0 == selectedTeg}}) { model in
                        Button {
                            selectedDish = model
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.4, blendDuration: 0.4)) {
                                isPresent = true
                            }
                        } label: {
                            VStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("background"))
                                    .frame(height: height(proxy.size.width))
                                    .overlay {
                                        AsyncImage(url: URL(string: model.imageUrl)) { phase in
                                            phase.image?
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                        .padding()
                                    }
                                
                                Text(model.name)
                                    .foregroundColor(.black)
                                    .font(.custom("SF Pro Display", size: 14))
                                    .frame(alignment: .leading)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .toolbar(.hidden, for: .navigationBar)
    }
    
    func height(_ width: CGFloat) -> CGFloat {
        (width / CGFloat(columns.count)) - 16
    }
    
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
