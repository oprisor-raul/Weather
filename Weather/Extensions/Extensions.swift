//
//  Extensions.swift
//  Weather
//
//  Created by Oprișor Raul-Alexandru on 18.07.2022.
//

import Foundation
import UIKit
import SwiftUI

extension Double {
    //    Round Double to Int and return String
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    func corneRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        //        Round the corners of a view
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
