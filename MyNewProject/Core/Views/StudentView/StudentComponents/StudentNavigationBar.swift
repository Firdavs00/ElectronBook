//
//  StudentNavigationBar.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct StudentNavigationBar: View {
    @State var tapBlur: Bool = false
    @Binding var showMenu: Bool
    @Binding var showCreate: Bool
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    var body: some View {
        VStack {
            HStack {
                Button{
                    tapBlur = true
                    withAnimation {
                        animateBG.toggle()
                    }
                    withAnimation(.spring()) {
                        showMenu.toggle()
                    }
                    // Animating Path with little Dwlay...
                    withAnimation(
                        .interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3).delay(0.2)) {
                            animatePath.toggle()
                        }
                } label: {
                    Image("menu")
                        .padding(.leading)
                }
                Spacer()
                Text("Elektron darslik")
                    .font(.headline)
                 
                Spacer()
                Button {
                    showCreate.toggle()
                } label: {
                    Image("create")
                        .padding(.trailing)
                }
                .hidden()
            }
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.black)
        }
        .padding(.top,40)
    }
}

//struct StudentNavigationBar_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentNavigationBar()
//    }
//}
