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

    struct SuperTextField: View {
        
        @Binding var text: String
        var placeholder: Text
       
        var editingChanged: (Bool)->() = { _ in }
        var commit: ()->() = { }

        var body: some View {
            
            ZStack(alignment: .leading) {
                
                if text.isEmpty { placeholder }
                
                TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
            }
        }

    }
struct SecureTextField: View {
    
    @Binding var text: String
    var placeholder: Text
   
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            if text.isEmpty { placeholder }
            
           SecureField("", text: $text, onCommit: commit)
        }
    }
}

struct FirstResponderTextField: UIViewRepresentable {
    
        @Binding var text: String
        var placeholder: String
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var becameFirstResponder = false
        init(text: Binding<String>) {
            self._text = text
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            text = textField.text ?? ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(text: $text)
    }
    func makeUIView(context: Context) -> some UIView {
        
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if !context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = true
        }
    }
}

extension Color {
    init(hex: String) {
        
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
