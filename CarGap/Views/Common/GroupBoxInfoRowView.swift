//
//  GroupBoxInfoRowView.swift
//  CarGap
//
//  Created by Damian Ruta on 16/11/2022.
//

import SwiftUI

struct GroupBoxInfoRowView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                Text(content)
            }
            .padding(.vertical, 5)
        }
    }
}

struct GroupBoxInfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxInfoRowView(title: "Version", content: "0.0.1")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
