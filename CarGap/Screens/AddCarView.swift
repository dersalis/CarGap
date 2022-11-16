//
//  AddCarView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

struct AddCarView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var description: String = ""
    @State var mark: String = ""
    @State var model: String = ""
    @State var year: String = ""
    @State var photo: String = ""
    
    @State var isSaveDisabled: Bool = true
    @State var secondTank: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
//                Divider()
                VStack {
                    
                    GroupBox(
                        label: Label("Car", systemImage: "car")
                    ){
                        Divider()
                        TextField("Name", text: $name)
                            .onChange(of: name) { newValue in
                                print(newValue)
                                isSaveDisabled = newValue.count > 0 ? true : false
                            }
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Mark", text: $mark)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Model", text: $model)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("RegistrationNo", text: $year)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Description", text: $description)
                            .padding(.vertical, 5)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    
                    GroupBox(
                        label: Label("Fuel", systemImage: "fuelpump")
                    ){
                        Group {
                            Divider()
                            HStack {
                                Text("First tank")
                                Spacer()
                            }
                            
                            TextField("Tank capacity", text: $name)
                                .padding(.vertical, 5)
                            
                            Divider()
                            TextField("Fuel type", text: $name)
                                .padding(.vertical, 5)
                            
                            Divider()
                            TextField("Fuel unit", text: $name)
                                .padding(.vertical, 5)
                            
                            Divider()
                            TextField("Combustion unit", text: $name)
                                .padding(.vertical, 5)
                        }
                        
                        Divider()
                        Toggle(isOn: $secondTank) {
                            Text("Second tank")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                        
                        Group {
                            Divider()
                            HStack {
                                Text("Second tank")
                                Spacer()
                            }
                            
                            TextField("Tank capacity", text: $name)
                                .padding(.vertical, 5)
                            
                            Divider()
                            TextField("Fuel type", text: $name)
                                .padding(.vertical, 5)
                            
                            Divider()
                            TextField("Fuel unit", text: $name)
                                .padding(.vertical, 5)
                            
                            Divider()
                            TextField("Combustion unit", text: $name)
                                .padding(.vertical, 5)
                        }
                        .frame(height: secondTank ? nil : 0)
                        .opacity(secondTank ? 1 : 0)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    
                    GroupBox(
                        label: Label("Description", systemImage: "list.bullet.rectangle")
                    ){
                        Divider()
                        TextField("Photo", text: $name)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Year", text: $mark)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("VIN", text: $model)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Insurande", text: $year)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Insurande date", text: $description)
                            .padding(.vertical, 5)
                        
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
                            //Image(systemName: "xmark")
                            Text("Cancel")
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            //Image(systemName: "plus")
                            Text("Save")
                                .disabled(isSaveDisabled)
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
