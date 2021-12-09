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
        
        NavigationView {
            
            ZStack {
                Color.odaBackgroundColor.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        ForEach(odaCartViewModel.products) { product in
                                                                        //FIXME: ADDTOCART
                            OdaCartCellView(viewModel: odaCartViewModel, productId: product.id, productName: product.name,
                                            productDescription: product.nameExtra,
                                            productImageUrl: product.images[0].thumbnail.url,
                                            productGrossPrice:product.grossPrice,
                                            productGrossUnitPrice: product.grossUnitPrice,
                                            productUnitAbbreviation: product.unitPriceQuantityAbbreviation
                            )
                            Divider()
                                .frame(maxWidth: .infinity)
                                .padding(.leading, 20)
                        }
                    }
                    
                    HStack(){
                        Group{
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 18, height: 18, alignment: .leading)
                                .padding(.leading, 15)
                            
                            Text("\("N/A") products")
                            Spacer()
                            Text("kr \("N/A")")
                                .padding(.trailing, 15)
                        }
                        .font(Font.rubikMedium(size: 14.0))
                        .foregroundColor(Color.primaryTextColor)
                        
                    }
                    .padding(.top, 5)
                    
                }
            }
            .navigationBarTitle(Text("Shopping Cart"), displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



//struct OdaCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        OdaCartView()
//    }
//}
