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
