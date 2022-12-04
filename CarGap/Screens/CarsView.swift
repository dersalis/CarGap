//
//  CarsView.swift
//  CarGap
//
//  Created by Damian Ruta on 03/12/2022.
//

import SwiftUI

struct CarsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .reverse)]) var dbcars: FetchedResults<Car>
    @AppStorage("selectedCarUUID") var selectedCarUUID: UUID?
    
    @State private var selectedCar: FetchedResults<Car>.Element?
    
    @State private var showingAddView: Bool = false
    
//    private var cars: [CarItem] = [
//        CarItem(name: "Dacia Duster", photo: "mycar", year: 2021),
//        CarItem(name: "Kia Sportage", photo: "mycar2", year: 2005),
//        CarItem(name: "Renault Clio", photo: "mycar3", year: 2015),
//        CarItem(name: "VW Golf", photo: nil, year: 2020)
//    ]
    private var cars: [CarItem] = []
    
    // TODO: Zastąpić!!!
    let year: Int = (Calendar.current.dateComponents([.year], from: Date())).year!
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if selectedCar != nil {
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
                                CircleImage(imageData: selectedCar?.photo!, size: 45, isShadow: false)
                                    .padding(.leading, 8)

                                Spacer()
                                VStack(alignment: .trailing, spacing: 5) {
                                    Text(selectedCar?.name! ?? "")
                                        .font(.title3)
                                    HStack {
                                        Text(selectedCar?.registrationNo! ?? "")
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
                        .padding(.top, 5)

                    }
                    .padding(.top, 5)
                }
                

                
                // Jeli na liście są pojazdy
                if dbcars.count > 0 {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(dbcars) { car in
                            VStack {
                                HStack {
                                    CircleImage(imageData: car.photo, size: 45)
                                        .padding(.leading, 8)
                                       
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(car.name!)
                                            .font(.title3)
                                        HStack {
                                            if car.year != nil {
                                                HStack {
                                                    Image(systemName: "calendar")
                                                        .foregroundColor(.gray)
                                                        .font(.footnote)
                                                    Text("\(year)")
                                                        .font(.footnote)
                                                    .foregroundColor(.gray)
                                                }
                                                .padding(.trailing, 20)
                                            }
                                            
                                            if !car.registrationNo!.isEmpty {
                                                HStack {
                                                    Image(systemName: "car")
                                                        .foregroundColor(.gray)
                                                        .font(.footnote)
                                                    Text(car.registrationNo!)
                                                        .font(.footnote)
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                            
                                        }
                                    }
                                    .padding(.leading, 16)
                                    Spacer()
                                    
                                    Button {
                                        // Edycja
                                    } label: {
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                                Divider()
                                    .padding(.leading, 60)
                            }
                            .onTapGesture {
                                print("onTapGesture: \(car.name!)")
                                selectedCarUUID = car.id
                                print("selectedCarUUID: \(selectedCarUUID!)")
//                                let selCar = (dbcars.filter({$0.id == selectedCarUUID!})[0])
                                selectedCar = dbcars.first {$0.id == selectedCarUUID!}
                                print("selectedCar: \(selectedCar!)")
                            }
                        }
                        .padding(.top, 30)
                    }
                    .padding(.top, -10)
                    
                } else {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Add car")
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
                
                
                
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
    var photo: String?
    var year: Int
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
