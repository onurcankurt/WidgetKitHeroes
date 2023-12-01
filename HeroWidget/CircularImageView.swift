//
//  CircularImageView.swift
//  HeroWidget
//
//  Created by onur on 30.11.2023.
//

import SwiftUI

struct CircularImageView: View {
    
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 5))
            .shadow(radius: 15)
    }
}

#Preview {
    CircularImageView(image: Image("spiderman"))
}
