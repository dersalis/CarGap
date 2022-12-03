//
//  RefuelingHistoryView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

struct RefuelingHistoryView: View {
    private var refuelings: [Refueling] = [
        Refueling(quantity: 35, date: "11.07.2022", totalDistance: 23475, distance: 235, totalCost: 84.34, cost: 4.43, localization: "Orlen - Piła"),
        Refueling(quantity: 45, date: "19.07.2022", totalDistance: 23821, distance: 301, totalCost: 81.43, cost: 3.76, localization: "Orlen - Wronki"),
        Refueling(quantity: 42, date: "25.07.2022", totalDistance: 23921, distance: 289, totalCost: 79.23, cost: 3.86, localization: "Orlen - Czarnków")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GroupBox(
                    label: HStack {
                        Label("Last", systemImage: "fuelpump")
                    }
                ){
                    Divider()
                    VStack(spacing: 8) {
                        
                        HStack(alignment: .top) {
                            HStack(spacing: 4) {
                                Text("\(refuelings[0].quantity)")
                                    .font(.system(size: 26, weight: .bold))
                                Text("litry")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                    .padding(.top, 10)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.top, -3)
                            HStack {
                                Text(refuelings[0].date)
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
                        
                        HStack {
                            HStack {
                                Image(systemName: "gauge")
                                    .imageScale(.medium)
                                    .foregroundColor(.accentColor)
                                    .frame(minWidth: 24)
                                Text("\(refuelings[0].totalDistance)")
                                Text("Km")
                            }
                            
                            
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            HStack {
                                Text("\(refuelings[0].distance)")
                                    .foregroundColor(.gray)
                                Text("Km")
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            HStack {
                                Image(systemName: "banknote")
                                    .imageScale(.medium)
                                    .foregroundColor(.accentColor)
                                    .frame(minWidth: 24)
                                Text("\(refuelings[0].totalCost, specifier: "%.2f")")
                                Text("Zł")
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            HStack {
                                Text("\(refuelings[0].cost, specifier: "%.2f")")
                                    .foregroundColor(.gray)
                                Text("Zł/l")
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .imageScale(.medium)
                                .foregroundColor(.accentColor)
                                .frame(minWidth: 24)
                            Text(refuelings[0].localization)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }

                }
                .padding(.top, 5)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(refuelings) { refueling in
                        
                        VStack(spacing: 8) {
                            HStack(alignment: .top) {
                                HStack(spacing: 4) {
                                    Text("\(refueling.quantity)")
                                        .font(.system(size: 26, weight: .bold))
                                    Text("litry")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                        .padding(.top, 10)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.top, -3)
                                HStack {
                                    Text(refueling.date)
                                        .foregroundColor(.gray)
                                    
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
                            
                            HStack {
                                HStack {
                                    Image(systemName: "gauge")
                                        .imageScale(.medium)
                                        .foregroundColor(.accentColor)
                                        .frame(minWidth: 24)
                                    Text("\(refueling.totalDistance)")
                                    Text("Km")
                                }
                                
                                
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                HStack {
                                    Text("\(refueling.distance)")
                                        .foregroundColor(.gray)
                                    Text("Km")
                                        .foregroundColor(.gray)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            }
                            
                            HStack {
                                HStack {
                                    Image(systemName: "banknote")
                                        .imageScale(.medium)
                                        .foregroundColor(.accentColor)
                                        .frame(minWidth: 24)
                                    Text("\(refueling.totalCost, specifier: "%.2f")")
                                    Text("Zł")
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                HStack {
                                    Text("\(refueling.cost, specifier: "%.2f")")
                                        .foregroundColor(.gray)
                                    Text("Zł/l")
                                        .foregroundColor(.gray)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            }
                            
                            Divider()
                            
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .imageScale(.medium)
                                    .foregroundColor(.accentColor)
                                    .frame(minWidth: 24)
                                Text(refueling.localization)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            
                        }
                        
                        Divider()
                            .padding(.vertical)
                        
                    }
                    .padding(.top, 30)
                }
                .padding(.top, -10)
                
            }
            .padding(.horizontal)
            .navigationTitle("Refueling history")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {}) {
                        Label("Add refuling", systemImage: "plus")
                    }
                }
            }
        }
    }
}

struct Refueling: Identifiable {
    var id: UUID = UUID()
    var quantity: Int
    var date: String
    var totalDistance: Int
    var distance: Int
    var totalCost: Double
    var cost: Double
    var localization: String
}

struct RefuelingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        RefuelingHistoryView()
    }
}
