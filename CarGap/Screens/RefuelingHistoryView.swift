//
//  RefuelingHistoryView.swift
//  CarGap
//
//  Created by Damian Ruta on 14/11/2022.
//

import SwiftUI

struct RefuelingHistoryView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
            }
            .navigationTitle("Refueling history")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {}) {
                        Label("Add refuling", systemImage: "fuelpump")
                    }
                }
            }
        }
    }
}

struct RefuelingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        RefuelingHistoryView()
    }
}
