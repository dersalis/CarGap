//
//  ContentView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedCarName") var selectedCarName: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
            }
            .navigationTitle(selectedCarName)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Section {
                            Button(action: {
                                selectedCarName = "Dacia Duster"
                            }) {
                                Label("Dacia Duster", systemImage: "doc")
                            }

                            Button(action: {
                                selectedCarName = "Renault Clio"
                            }) {
                                Label("Renault Clio", systemImage: "folder")
                            }
                        }
                        Section {
                            Button(action: {}) {
                                Label("Add car", systemImage: "plus")
                            }
                        }
                    }
                    label: {
                        Label("Cars", systemImage: "car.2")
                    }
                }
                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        //showingAddView.toggle()
//                    } label: {
//                        Label("Cars", systemImage: "car.2")
//                    }
//                }

            }
        }
        .onAppear {
            selectedCarName = "Selected Car" // TODO: Usunąć
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
