//
//  AddCarView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI
import PhotosUI

struct AddCarView: View {
    @Environment(\.presentationMode) var presentationMode
//    @Environment(\.managedObjectContext) var managedObjectContext
    
    private let fuelTypes: [PickerItem] = fuelTypesData
    private let fuelUnits: [PickerItem] = fuelUnitsData
    private let combustionUnits: [PickerItem] = combustionUnitsData
    
    @State var car: AddCar = AddCar()
    
    @State var selectedPhoto: PhotosPickerItem? = nil
    
    @State var isSaveDisabled: Bool = true
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // Car
                    GroupBox(
                        label: Label("Car", systemImage: "car")
                    ){
                        Divider()
                        TextField("Name", text: $car.name)
                            .onChange(of: car.name) { newValue in
                                print(newValue)
                                isSaveDisabled = newValue.count > 0 ? true : false
                            }
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Mark", text: $car.mark)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Model", text: $car.model)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("RegistrationNo", text: $car.registrationNo)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Description", text: $car.description)
                            .padding(.vertical, 5)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    // Fuel - tank 1
                    GroupBox(
                        label: Label(car.isSecondTank ? "Fuel - tank 1" : "Fuel", systemImage: "fuelpump")
                    ){
                        
                        Divider()
                        TextField("Tank capacity", text: $car.tankCapacity1)
                            .keyboardType(.numberPad)
                            .padding(.vertical, 5)
                        
                        Divider()
                        HStack {
                            Text("Fuel type")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $car.fuelType1, label: Text("Fuel type")) {
                                ForEach(0 ..< fuelTypes.count) {
                                    Text(self.fuelTypes[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                        Divider()
                        HStack {
                            Text("Fuel unit")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $car.fuelUnit1, label: Text("Fuel unit")) {
                                ForEach(0 ..< fuelUnits.count) {
                                    Text(self.fuelUnits[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                        Divider()
                        HStack {
                            Text("Combustion unit")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $car.combustionUnit1, label: Text("Combustion unit")) {
                                ForEach(0 ..< combustionUnits.count) {
                                    Text(self.combustionUnits[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    // Toggler
                    GroupBox {
                        Toggle(isOn: $car.isSecondTank) {
                            Text("Second tank")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, car.isSecondTank ? 5 : -2)
                    .padding(.horizontal)
                    
                    // Fuel - tank 2
                    GroupBox(
                        label: Label("Fuel - tank 2", systemImage: "fuelpump")
                    ){
                        
                        Divider()
                        TextField("Tank capacity", text: $car.tankCapacity2)
                            .keyboardType(.numberPad)
                            .padding(.vertical, 5)
                        
                        Divider()
                        HStack {
                            Text("Fuel type")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $car.fuelType2, label: Text("Fuel type")) {
                                ForEach(0 ..< fuelTypes.count) {
                                    Text(self.fuelTypes[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                        Divider()
                        HStack {
                            Text("Fuel unit")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $car.fuelUnit2, label: Text("Fuel unit")) {
                                ForEach(0 ..< fuelUnits.count) {
                                    Text(self.fuelUnits[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                        Divider()
                        HStack {
                            Text("Combustion unit")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $car.combustionUnit2, label: Text("Combustion unit")) {
                                ForEach(0 ..< combustionUnits.count) {
                                    Text(self.combustionUnits[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .opacity(car.isSecondTank ? 1 : 0)
                    .frame(height: car.isSecondTank ? nil : 0)
                    
                    // Description
                    GroupBox(
                        label: Label("Description", systemImage: "list.bullet.rectangle")
                    ){
                        Divider()
                        HStack {
                            PhotosPicker(
                                selection: $selectedPhoto,
                                matching: .images,
                                photoLibrary: .shared()) {
                                    Text("Photo")
                                }
                                .onChange(of: selectedPhoto) { newItem in
                                    Task {
                                        // Retrieve selected asset in the form of Data
                                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                            car.photo = data
                                        }
                                    }
                                }
                                .padding(.vertical, 6)
                            Spacer()
                            if car.photo != nil,
                               let uiImage = UIImage(data: car.photo!) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    //.scaledToFit()
                                    .frame(width: 30, height: 28)
                                    .cornerRadius(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.gray, lineWidth: 0.5))
                                    
                            }
                        }
                        
                        Divider()
                        HStack {
                            Text("Year")
                                .foregroundColor(.gray)
                            Spacer()
                            DatePicker(selection: Binding<Date>(get: {car.year ?? Date()}, set: { car.year = $0}), displayedComponents: .date) {}
                                .padding(.top, 1)
                        }
                        .padding(.vertical, 1)
                        
                        Divider()
                        TextField("VIN", text: $car.vin)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Insurande", text: $car.insurande)
                            .padding(.vertical, 5)
                        
                        Divider()
                        HStack {
                            Text("Insurande date")
                                .foregroundColor(.gray)
                            Spacer()
                            DatePicker(selection: Binding<Date>(get: {car.insurandeDate ?? Date()}, set: { car.insurandeDate = $0}), displayedComponents: .date) {}
                                .padding(.top, 1)
                                .padding(.bottom, -5)
                        }
                        .padding(.vertical, 1)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    
                }
                .navigationBarTitle("Add car")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel")
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // CarController().addCar(newCar: car, context: managedObjectContext)
                            CarController().add(newCar: car)
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Save")
                                .disabled(car.name.isEmpty)
                        })
                    }
                }
            }
        }
    }
}

struct AddCarView_Previews: PreviewProvider {
    static var previews: some View {
        AddCarView()
    }
}
