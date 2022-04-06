//
//  NavigationBar.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct TeacherNavigationBar: View {
    
    @Binding var showMenu: Bool
    @Binding var showCreate: Bool
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button{
                    
                    // Animating Path with little Dwlay...
                    withAnimation(
                        .interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3).delay(0.2)) {
                            
                            animatePath.toggle()
                            
                    withAnimation {
                        
                        animateBG.toggle()
                        
                    }
                    withAnimation(.spring()) {
                        
                        showMenu.toggle()
                    }
                        }
                } label: {
                    
                    Image(systemName: "line.3.horizontal")
                        .padding(.leading)
                        .foregroundColor(Color("acsentColor"))
                }
                
                Spacer()
                
                Text("O'quv Darsliklari")
                    .font(.headline)
                    .foregroundColor(Color("basicTitlesColor"))
                
                Spacer()
                
                Button {
                    
                    showCreate.toggle()
                    
                } label: {
                    
                    Image(systemName: "folder.fill.badge.plus")
                        .padding(.trailing)
                        .foregroundColor(Color("acsentColor"))

                }
                .sheet(isPresented: $showCreate, content: {
                    
                    CreateView()
                    
                })
            }
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(Color("acsentColor"))
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        TeacherNavigationBar(showMenu: .constant(true), showCreate: .constant(true), animatePath: .constant(true), animateBG: .constant(true))
            
    }

}
