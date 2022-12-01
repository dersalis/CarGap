//
//  CarGapApp.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

@main
struct CarGapApp: App {
    @State private var carController: CarController = CarController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, carController.container.viewContext)
        }
    }
}
