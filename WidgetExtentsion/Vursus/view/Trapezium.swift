//
//  SqureView.swift
//  GGPO
//
//  Created by Lee on 2023/06/10.
//

import SwiftUI

struct Trapezium: Shape {
    
    var offset: CGFloat = 1
    var corner: UIRectCorner = .topLeft
    
    var animatableData: CGFloat {
        get { return offset }
        set { offset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 시작점 - TopLeft
        //Y좌표에서 cornerdl .topLeft라면 rect.maxy * offset
        path.move(to: CGPoint(x: 0, y: corner == .topLeft ? rect.maxY * offset : 0 ))
        // TopRight
        path.addLine(to: CGPoint(x: rect.maxX, y: corner == .topRight ? rect.maxY * offset : 0))
        // Bottom Right
        path.addLine(to: CGPoint(x: rect.maxX, y: corner == .bottomRight ? rect.maxY * offset : rect.maxY))
        
        path.addLine(to: CGPoint(x: 0, y: corner == .bottomLeft ? rect.maxY * offset : rect.maxY))
        
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    Trapezium()
        .frame(width: 388, height: 354)
}
