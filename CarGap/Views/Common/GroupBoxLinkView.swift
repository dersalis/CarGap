//
//  GroupBoxLinkView.swift
//  CarGap
//
//  Created by Damian Ruta on 16/11/2022.
//

import SwiftUI

struct GroupBoxLinkView: View {
    var title: String
    var linkLabel: String
    var linkDestination: String
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                Link(linkLabel, destination: URL(string: "http://\(linkDestination)")!)
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(.pink)
            }
            .padding(.vertical, 5)
        }
    }
}

struct GroupBoxLinkView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxLinkView(title: "Twiter", linkLabel: "@damianruta", linkDestination: "twiter.com/damianruta")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
