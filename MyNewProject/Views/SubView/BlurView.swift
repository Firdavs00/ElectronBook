//
//  BlurView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import Foundation
import SwiftUI

struct BlurView: UIViewRepresentable {
   
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
