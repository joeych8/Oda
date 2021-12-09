//
//  OdaCartCellView.swift
//  Oda
//
//  Created by joey chau on 17/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct OdaCartCellView: View {
    
    @ObservedObject var viewModel: OdaCartViewModel      //FIXME: ADDTOCART
        
    @State var counter = 0

    let productId: Int      //FIXME: ADDTOCART
    let productName: String
    let productDescription: String
    let productImageUrl: String
    let productGrossPrice: String
    let productGrossUnitPrice: String
    let productUnitAbbreviation: String
    
    
    var body: some View {
        
        HStack { //Big Image on click / state var open sheet / view
            
            WebImage(url: URL(string: productImageUrl))
                .resizable()
                //.onTapGesture {
                    
                //}
                .placeholder(Image("placeHolder"))
                .scaledToFit()
                .frame(width: 56.0, height: 56.0)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(productName)
                    .foregroundColor(Color.primaryTextColor)
                    .font(Font.rubikMedium(size: 14.0))
                    .frame( alignment: .leading)
                    .lineLimit(1)
                
                Text(productDescription)
                    .foregroundColor(Color.secondaryTextColor)
                    .font(Font.rubikRegular(size: 14.0))
                    .lineLimit(1)
            }
            
            Spacer()
            
            //Single plus button shows when counter is 0
            if counter == 0 {
                HStack {
                    VStack(alignment: .trailing, spacing: 5) {
                        Text("kr \(productGrossPrice)")
                            .font(Font.rubikMedium(size: 14.0))
                            .lineLimit(1)
                        
                        Group{
                            HStack(spacing: 0){
                                Text("kr \(productGrossUnitPrice)")
                                
                                Text("/\(productUnitAbbreviation)")
                                
                            }
                            .foregroundColor(Color.secondaryTextColor)
                            .font(Font.rubikRegular(size: 14.0))
                            .lineLimit(1)
                        }
                    }
                    
                    Button {
                        add()
                        //AddItemToCart
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color.odaButtonColor)
                            .frame(width: 32.0, height: 32.0, alignment: .trailing)
                            .font(Font.title.weight(.light))
                    }
                }
                
            // if counter equals to 1 or more, remove single plus button with 2 new buttons and a text that shows product quantity
            } else {
                HStack{
                    Button {
                        subtract()
                        //Remove item from Cart
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .foregroundColor(Color.secondaryTextColor)
                            .frame(width: 32.0, height: 32.0, alignment: .center)
                    }
                    
                    Text(String(counter)) //TODO: counter replace with variable ?
                        .foregroundColor(Color.primaryTextColor)
                        .font(Font.rubikMedium(size: 14.0))
                        .lineLimit(1)
                    
                    Button {
                        add()
                        //AddItemToCart
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color.secondaryTextColor)
                            .frame(width: 32.0, height: 32.0, alignment: .center)
                        
                    }
                }
            }
        }
        
       /* .sheet(isPresented: <#T##Binding<Bool>#>, onDismiss: {
            <#code#>
        }, content: {
            //Zstack
        }) */
        
        .padding(.horizontal, 10)
        
    }
    
   //FIXME: ADDTOCART
    
    private func add() {
        
        //counter += 1
        //viewModel.addProductToCart(productId: productId, productQuantity: 1)    //FIXME: ADDTOCART
    }
    
    private func subtract() {
        counter -= 1
       // viewModel.removeFromCart(productId: productId, removeQuantity: 1)    //FIXME: ADDTOCART
    }
    
    
}








//struct OdaCartCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        OdaCartCellView(productName: "ape", productDescription: "dont taste good", productImage: "product.images[0].thumbnail.url", productGrossPrice: "123", productGrossUnitPrice: "321")
//    }
//}
