//
//  ContentView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    //@AppStorage("selectedCarName") var selectedCarName: String = ""
    
    var body: some View {
        TabView {
            CarView()
                .tabItem {
                    Label("Garage", systemImage: "door.garage.closed")
                }
            RefuelingHistoryView()
                .tabItem {
                    Label("History", systemImage: "chart.bar.fill")
                }
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.xyaxis.line")
                }
            CarsView()
                .tabItem {
                    Label("Cars", systemImage: "car.2.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "slider.vertical.3")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
