//
//  OdaCartCellView.swift
//  Oda
//
//  Created by joey chau on 17/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct OdaCartCellView: View {
    
    @StateObject var odaCartViewModel = OdaCartViewModel()
    @State var largeImage = false
    @Binding var shoppingCart: [Int: Int] {
        didSet{
            //saveItems() runs whenever shoppingCart is updated. e.g adding or removing items from shoppingCart
            saveItems()
        }
    }
    
    var cartItemCounter: Int {
        return shoppingCart[productId] ?? 0
    }
    
    let productId: Int
    let productName: String
    let productDescription: String
    let productImageUrl: String
    let productGrossPrice: String
    let productGrossUnitPrice: String
    let productUnitAbbreviation: String
    let isAvailable: Bool
    let isDiscounted: Bool
    let undiscountedGrossPrice: String
    
    var body: some View {
        
        Spacer()
            .frame(height: 10)
        HStack {
            //If isDiscounted, show discountbanner("Salg!")
            if isDiscounted {
                VStack{
                    WebImage(url: URL(string: productImageUrl))
                        .resizable()
                        .placeholder(Image("placeHolder"))
                        .onTapGesture {
                            largeImage = true
                        }
                        .scaledToFit()
                        .frame(width: 56.0, height: 56.0)
                        .overlay(OdaDiscountBanner()
                                    .fill(Color.odaDiscountBannerBackground)
                                    .rotationEffect(.degrees(-45))
                                    .frame(width: 50, height: 25)
                                    .overlay(Text("Salg!")
                                                .rotationEffect(.degrees(-45))
                                                .foregroundColor(Color.odaDiscountBannerTextColor)
                                                .font(Font.rubikMedium(size: 8))
                                                .offset(x: 3, y: 3))
                                    .offset(x: -29, y: -30))
                }
                
            } else {
                
                WebImage(url: URL(string: productImageUrl))
                    .resizable()
                    .placeholder(Image("placeHolder"))
                    .onTapGesture {
                        largeImage = true
                    }
                    .scaledToFit()
                    .frame(width: 56.0, height: 56.0)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(productName)
                    .foregroundColor(Color.primaryTextColor)
                    .font(Font.rubikMedium(size: 14.0))
                    .frame( alignment: .leading)
                    .lineLimit(1)
                
                if isAvailable == true {
                    Text(productDescription)
                        .foregroundColor(Color.secondaryTextColor)
                        .font(Font.rubikRegular(size: 14.0))
                        .lineLimit(1)
                } else {
                    Text("Out of stock")
                        .foregroundColor(Color.odaOutOfStockTextColor)
                        .font(Font.rubikRegular(size: 14.0))
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            //Single plus button shows when counter is 0
            if cartItemCounter == 0 {
                HStack {
                    if isDiscounted == false {
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
                    } else {
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("kr \(productGrossPrice)")
                                .foregroundColor(Color.odaDiscountedTextColor)
                                .font(Font.rubikMedium(size: 14.0))
                                .lineLimit(1)
                            
                            HStack(spacing: 0){
                                Text("kr \(undiscountedGrossPrice)")
                                    .strikethrough()
                                    .foregroundColor(Color.secondaryTextColor)
                                    .font(Font.rubikRegular(size: 14.0))
                                    .lineLimit(1)
                            }
                        }
                    }
                    
                    if isAvailable == true {
                        Button {
                            //AddItemToCart
                            addItem()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .foregroundColor(Color.odaButtonColor)
                                .frame(width: 32.0, height: 32.0, alignment: .trailing)
                                .font(Font.title.weight(.light))
                        }
                    } else {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .foregroundColor(Color.odaButtonColor)
                                .opacity(0.5)
                                .frame(width: 32.0, height: 32.0, alignment: .trailing)
                                .font(Font.title.weight(.light))
                        }.disabled(true)
                        
                    }
                }
                // if counter equals to 1 or more, remove single plus button with 2 new buttons and a text that shows product quantity
            } else {
                
                HStack{
                    Button {
                        //Remove item from Cart
                        removeItem()
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .foregroundColor(Color.secondaryTextColor)
                            .frame(width: 32.0, height: 32.0, alignment: .center)
                    }
                    
                    Text(String(cartItemCounter)) //TODO: counter replace with variable ?
                        .foregroundColor(Color.primaryTextColor)
                        .font(Font.rubikMedium(size: 14.0))
                        .lineLimit(1)
                    
                    Button {
                        //AddItemToCart
                        addItem()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color.secondaryTextColor)
                            .frame(width: 32.0, height: 32.0, alignment: .center)
                    }
                }
            }
        }.onAppear(perform: {
            getItems()
            print(shoppingCart)
        })
            .fullScreenCover(isPresented: $largeImage, content: {
                OdaLargeImageView(imageString: productImageUrl)
            })
            .padding(.horizontal, 10)
        Spacer()
            .frame(height: 10)
    }
    
    //adds item to Cart
    func addItem() {
        shoppingCart[productId] = cartItemCounter + 1
        print(shoppingCart)
    }
    
    //Remove item from Cart
    func removeItem() {
        shoppingCart[productId] = max(0, cartItemCounter - 1)
        
        if cartItemCounter == 0 {
            shoppingCart.removeValue(forKey: productId)
        }
        print(shoppingCart)
    }
    
    //Save item to shoppingCart
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(shoppingCart) {
            UserDefaults.standard.set(encodedData, forKey: Constants.SAVED_SHOPPING_CART)
        }
    }
    
    //Get saved shoppingCart
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: Constants.SAVED_SHOPPING_CART),
            let savedItems = try? JSONDecoder().decode([Int: Int].self, from: data)
        else
            
        { return }
        
        self.shoppingCart = savedItems
    }
    
    
    
}


//struct OdaCartCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        OdaCartCellView(productName: "ape", productDescription: "dont taste good", productImage: "product.images[0].thumbnail.url", productGrossPrice: "123", productGrossUnitPrice: "321")
//    }
//}
