//
//  OdaLargeImageView.swift
//  Oda
//
//  Created by joey chau on 12/12/2021.
//

import SwiftUI
import SDWebImageSwiftUI


struct OdaLargeImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let imageString: String
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                        .frame(width: 25)
                }
                
                GeometryReader { geo in
                    WebImage(url: URL(string: imageString))
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 1.0)
                        .frame(width: geo.size.width, height: geo.size.height)
                }
            }
        }
    }
}

