//
//  CurvedBackgroundShape.swift
//  MovieApp
//
//  Created by BS00880 on 8/6/24.
//

import Foundation
import SwiftUI

struct CurvedBackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // bottom left corner
        path.move(to: CGPoint(x: 0, y: 0))
        
        // bottom right corner
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        
        // top right corner
        path.addLine(to: CGPoint(x: rect.width, y: -rect.height))
        
        // the cubic curve aligned to the right of the screen
        path.addCurve(
            to: CGPoint(x: rect.width * 0.5, y: -rect.height * 0.6),
            control1: CGPoint(x: rect.width * 0.7, y: -rect.height * 0.8),
            control2: CGPoint(x: rect.width * 0.66, y: -rect.height * 0.5)
        )
        
        // the cubic curve aligned to the left side of the screen
        path.addCurve(
            to: CGPoint(x: 0, y: -rect.height * 0.5),
            control1: CGPoint(x: rect.width * 0.3, y: -rect.height * 0.8),
            control2: CGPoint(x: rect.width * 0.2, y: -rect.height * 0.6)
        )
        
        // Close the path by drawing a line back to the start
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}
