//
//  Extension.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 19/12/21.
//

import Foundation
import SwiftUI

struct DefaultViewModifier: ViewModifier {
    
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .frame(width: 100, height: 30)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

extension View {
    func withDefaultFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultViewModifier(backgroundColor: backgroundColor))
    }
}

struct MenuShape: Shape {
    var value: CGFloat
    //Animating Path
    var animatableData: CGFloat {
        get { return value }
        set { return value = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            let width = rect.width - 150
            let height = rect.height
            
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            
            //Egri chiziq
            path.move(to: CGPoint(x: width, y: 0))
            path.addCurve(
                to: CGPoint(x: width, y: height + 150),
                control1: CGPoint(x: width + value, y: height / 3),
                control2: CGPoint(x: width - value, y: height / 2))
        }
    }
}

// xavfsiz hududni olish uchun ko'rinishni kengaytirish
extension View {
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else { return .zero }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
