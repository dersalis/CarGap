//
//  CircleImage.swift
//  CarGap
//
//  Created by Damian Ruta on 03/12/2022.
//

import SwiftUI

struct CircleImage: View {
    @Environment(\.colorScheme) var colorScheme
    
    var imageData: Data? = nil
    var size: CGFloat
    var isShadow: Bool = true
    
    private var image: UIImage? {
        return UIImage(data: imageData!)
    }
    
    var body: some View {
        if imageData != nil {
            Image(uiImage: image!)
                .resizable()
                .clipShape(Circle())
                .overlay{
                    Circle()
                        .stroke(colorScheme == .dark ? .gray : .white, lineWidth: 2)
                }
                .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), radius: isShadow == true ? 4 : 0)
                .frame(width: size, height: size)
        } else {
            ZStack {
                Circle()
                    .fill(.gray)
                    .overlay {
                        Circle()
                            .stroke(colorScheme == .dark ? .gray : .white, lineWidth: 2)
                    }
                    .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5), radius: isShadow == true ? 4 : 0)
                
                Image(systemName: "car")
                    .font(.system(size: size - 20))
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            .frame(width: size, height: size)
        }
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageData: nil, size: 80, isShadow: true)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
