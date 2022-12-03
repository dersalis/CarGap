//
//  CircleImage.swift
//  CarGap
//
//  Created by Damian Ruta on 03/12/2022.
//

import SwiftUI

struct CircleImage: View {
    @Environment(\.colorScheme) var colorScheme
    
    var imageName: String
    var size: CGFloat
    var isShadow: Bool = true
    
    var body: some View {
        Image(imageName)
            .resizable()
//            .scaledToFit()
            .clipShape(Circle())
            .overlay{
                Circle()
                    .stroke(colorScheme == .dark ? .gray : .white, lineWidth: 2)
            }
            .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), radius: isShadow == true ? 4 : 0)
            .frame(width: size, height: size)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "mycar3", size: 80, isShadow: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
