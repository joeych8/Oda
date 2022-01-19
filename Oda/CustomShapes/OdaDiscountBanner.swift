//
//  OdaDiscountBanner.swift
//  Oda
//
//  Created by joey chau on 14/12/2021.
//

import SwiftUI


struct OdaDiscountBanner: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}


struct OdaDiscountBanner_Previews: PreviewProvider {
    static var previews: some View {
        OdaDiscountBanner()
    }
}
