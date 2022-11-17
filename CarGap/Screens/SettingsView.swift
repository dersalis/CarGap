//
//  SettingsView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI
import UIKit

struct SettingsView: View {
    @State var appName: String = "CarGap"
    @State var appVersion: String? = UIApplication.appVersion
    @AppStorage("selectedDistanceUnit") var selectedDistanceUnit: Int = 0
    private let distanceUnits: [PickerItem] = distanceUnitsData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image(systemName: "fuelpump.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.primary)
                    .padding(.top, 20)
                    .padding(.bottom,10)
                
                Text(appName)
                    .font(.title)
                
                GroupBox(
                    label: Label("About", systemImage: "ipad.and.iphone")
                ){
                    GroupBoxInfoRowView(title: "Version", content: appVersion!)
                    GroupBoxInfoRowView(title: "Designer & Developer", content: "Damian Ruta")
                    GroupBoxLinkView(title: "Twiter", linkLabel: "@damianruta", linkDestination: "twiter.com/damianruta")
                    
                }
                .padding(.vertical, 5)
                .padding(.horizontal)
                
                GroupBox(
                    label: Label("Units", systemImage: "ruler")
                ){
                    VStack {
                        Divider()
                        HStack {
                            Text("Distance")
                                .foregroundColor(.gray)
                            Spacer()
                            Picker(selection: $selectedDistanceUnit, label: Text("Show Previews")) {
                                ForEach(0 ..< distanceUnits.count) {
                                    Text(self.distanceUnits[$0].value)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                    }
                }
                .padding(.vertical, 5)
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Settings")
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button(action: {}) {
//                        Label("Add refuling", systemImage: "fuelpump")
//                    }
//                }
//            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
