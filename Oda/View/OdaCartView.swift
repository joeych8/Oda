//
//  ContentView.swift
//  Oda
//
//  Created by joey chau on 13/10/2021.

import SwiftUI
import SDWebImageSwiftUI

struct OdaCartView: View {
    
    @StateObject var odaCartViewModel = OdaCartViewModel()
    
    var body: some View {
        
        VStack{
            NavigationView {
                ZStack {
                    Color.odaBackgroundColor.edgesIgnoringSafeArea(.all)
                    ScrollView {
                        LazyVStack {
                            ForEach(odaCartViewModel.products) { product in
                                OdaCartCellView(shoppingCart: $odaCartViewModel.shoppingCart,
                                                productId: product.id,
                                                productName: product.name,
                                                productDescription: product.nameExtra,
                                                productImageUrl: product.images[0].thumbnail.url,
                                                productGrossPrice:product.grossPrice,
                                                productGrossUnitPrice: product.grossUnitPrice,
                                                productUnitAbbreviation: product.unitPriceQuantityAbbreviation,
                                                isAvailable: product.availability.isAvailable,
                                                isDiscounted: product.discount?.isDiscounted ?? false,
                                                undiscountedGrossPrice:product.discount?.undiscountedGrossPrice ?? "")
                                
                                Divider()
                                    .frame(maxWidth: .infinity)
                                    .padding(.leading, 20)
                                
                            }
                        }
                    }.background(Color.odaScrollViewBackgroundColor)
                        .ignoresSafeArea(.all, edges: .bottom)
                }
                .navigationBarTitle(Text("Shopping Cart"), displayMode: .inline)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            
            
            if odaCartViewModel.shoppingCart.values.isEmpty  {
                HStack{
                }
                
            } else {
                
                Divider()
                
                HStack{
                    Group{
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 18, height: 18, alignment: .leading)
                            .padding(.leading, 15)
                        
                        Text("\(odaCartViewModel.getShoppingCart().itemCount) products")
                        Spacer()
                        Text("kr \(String(odaCartViewModel.getShoppingCart().totalCost))")
                            .padding(.trailing, 15)
                    }
                    .font(Font.rubikMedium(size: 14.0))
                    .foregroundColor(Color.primaryTextColor)
                }
                .background(Color.odaBackgroundColor)
                .padding(.bottom, 50)
            }
        }
        .background(Color.odaBackgroundColor)
        .ignoresSafeArea(.all)
    }
}



//struct OdaCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        OdaCartView()
//    }
//}
