//
//  StudentNavigationBar.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct StudentNavigationBar: View {

    @Binding var showMenu: Bool
    @Binding var showCreate: Bool
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                
                Button{
                    
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
                    
                    Image(systemName: "line.3.horizontal")
                        .padding(.leading)
                        .foregroundColor(Color("acsentColor"))
                }
                
                Spacer()
                
                Text("Elektron darslik")
                    .font(.headline)
                    .foregroundColor(Color("basicTitlesColor"))
                 
                Spacer()
                
                Button {
                    
                    showCreate.toggle()
                    
                } label: {
                    
                    Image(systemName: "folder.fill.badge.plus")
                        .padding(.trailing)
                }
                .hidden()
            }
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(Color("acsentColor"))
        }
    }
}

struct StudentNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        StudentNavigationBar(showMenu: .constant(true), showCreate: .constant(true), animatePath: .constant(true), animateBG: .constant(true))
            
            
    }
}
