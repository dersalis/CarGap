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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
//                Divider()
                VStack {
                    
                    GroupBox(
                        label: Label("Car", systemImage: "car")
                    ){
//                        Divider()
                        TextField("Name", text: $name)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Description", text: $description)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Mark", text: $mark)
                            .padding(.vertical, 5)
                        
                        Divider()
                        TextField("Model", text: $model)
                            .padding(.vertical, 5)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    GroupBox(
                        label: Label("Units", systemImage: "ruler")
                    ){
                        Divider()
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    
                    GroupBox(
                        label: Label("Fuel", systemImage: "fuelpump")
                    ){
                        Divider()
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
