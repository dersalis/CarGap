//
//  CarsView.swift
//  CarGap
//
//  Created by Damian Ruta on 03/12/2022.
//

import SwiftUI

struct CarsView: View {
    @State private var showingAddView: Bool = false
    
    private var cars: [CarItem] = [
        CarItem(name: "Dacia Duster", photo: "mycar", year: 2021),
        CarItem(name: "Kia Sportage", photo: "mycar2", year: 2005),
        CarItem(name: "Renault Clio", photo: "mycar3", year: 2015)
    ]
    let year: Int = (Calendar.current.dateComponents([.year], from: Date())).year!
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GroupBox(
                    label: HStack {
                        Label("Selected car", systemImage: "car")
                        Spacer()
                        HStack(spacing: 20) {
                            Button {
                                
                            } label: {
                                Image(systemName: "pencil")
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                ){
                    Divider()
                    VStack {
                        HStack {
                            CircleImage(imageName: "mycar", size: 45, isShadow: false)
                                .padding(.leading, 8)
                                
                            Spacer()
                            VStack(alignment: .trailing, spacing: 5) {
                                Text("Dacia Duster")
                                    .font(.title3)
                                HStack {
                                    Text("PO 346542")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Text("|")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .opacity(0.25)
                                    Text("\(year)")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .padding(.leading, -10)

                }
                .padding(.top, 5)
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(cars) { car in
                        VStack {
                            HStack {
                                CircleImage(imageName: car.photo, size: 45)
                                    .padding(.leading, 8)
                                    
                                Spacer()
                                VStack(alignment: .trailing, spacing: 5) {
                                    Text(car.name)
                                        .font(.title3)
                                    HStack {
                                        Text("PO 346542")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                        Text("|")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                            .opacity(0.25)
                                        Text("\(year)")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            Divider()
                                .padding(.leading, 60)
                        }
                    }
                    .padding(.top, 30)
                }
                .padding(.top, -10)
            }
                
            .padding(.horizontal)
            .navigationTitle("Cars")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add car", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddCarView()
            }
        }
    }
}

struct CarItem: Identifiable {
    var id: UUID = UUID()
    var name: String
    var photo: String
    var year: Int
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
