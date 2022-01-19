//
//  Utils.swift
//  Oda
//
//  Created by joey chau on 08/12/2021.
//

import SwiftUI

extension Color {
    static let primaryTextColor = Color("PrimaryTextColor")
    static let secondaryTextColor = Color("SecondaryTextColor")
    static let odaButtonColor = Color("AccentActionColor")
    static let odaBackgroundColor = Color("BackgroundColor")
    static let odaOutOfStockTextColor = Color("OutOfStockTextColor")
    static let odaDiscountedTextColor = Color("DiscountTextColor")
    static let odaScrollViewBackgroundColor = Color("OdaScrollViewBackgroundColor")
    static let odaDiscountBannerBackground = Color("OdaDiscountBannerColor")
    static let odaDiscountBannerTextColor = Color("OdaDiscountBannerTextColor")
}


extension Font {
    static func rubikRegular(size: CGFloat) -> Font {
        return Font.custom("Rubik-Regular", size: size)
    }
    
    static func rubikMedium(size: CGFloat) -> Font {
        return Font.custom("Rubik-Medium", size: size)
    }
    
    static func rubikBold(size: CGFloat) -> Font {
        return Font.custom("Rubik-Bold", size: size)
    }
}
