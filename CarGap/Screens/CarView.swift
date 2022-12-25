//
//  CarView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

struct CarView: View {
    @AppStorage("selectedCarUUID") var selectedCarUUID: UUID?
    @State private var selectedCar: Car? = nil
    
//    @State private var isShowingAddCar: Bool = false
    
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                
                Image("mycar2")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: screenWidth, minHeight: 0, maxHeight: screenHeight / 2, alignment: .top)
                    .blur(radius: 5)
                
                CarBackgroundView()
                
                VStack (alignment: .leading) {
//                    NavigationLink(destination: CarsView()) {
//                        HStack{
//                            Text("Cars")
//                                .font(.system(size: 20))
//                                .fontWeight(.semibold)
//                                .foregroundColor(.primary)
//                            Image(systemName: "chevron.right")
//                                .font(.system(size: 16))
//                                .foregroundColor(.gray)
//                        }
//                        .padding(.bottom, -5)
//                    .padding(.top, 10)
//                    }
                    
                    GroupBox(
                        label: Label("Selected car", systemImage: "car")
                    ){
                        GroupBoxInfoRowView(title: "Name", content: "Dacia Duster")

                    }
                    .padding(.vertical, 5)
                    
                    
//                    NavigationLink(destination: CarsView()) {
//                        HStack{
//                            Text("Other")
//                                .font(.system(size: 20))
//                                .fontWeight(.semibold)
//                                .foregroundColor(.primary)
//                            Image(systemName: "chevron.right")
//                                .font(.system(size: 16))
//                                .foregroundColor(.gray)
//                        }
//                        .padding(.bottom, -5)
//                    .padding(.top, 10)
//                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 160)
                
            }
            .edgesIgnoringSafeArea(.all)
            //.navigationTitle(selectedCarName)
        }
        .onAppear(perform: {
            //CarController().count()
        })
//        .sheet(isPresented: $isShowingAddCar){
//            AddCarView()
//        }
    }
}

struct CarBackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var lightGradietnt: [Color] = [.white, .white, .white, .white.opacity(0.1)]
    private var darkGradient: [Color] = [.black, .black, .black, .black.opacity(0.1)]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? darkGradient : lightGradietnt), startPoint: .bottom, endPoint: .topTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
    }
}
