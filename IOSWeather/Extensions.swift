//
//  Extensions.swift
//  IOSWeather
//
//  Created by Oluwayomi M on 2022-01-06.
//

import Foundation
import SwiftUI

extension Double{
    func roundDouble() -> String{
        return String(format: "%.0f", self)
    }
    func roundtToOne() -> String{
        return String(format: "%.1f", self)
    }
}



extension View{
    func cornerRadius(_ radius:CGFloat , corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner (radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
