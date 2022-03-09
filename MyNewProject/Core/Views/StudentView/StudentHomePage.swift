//
//  StudentHomePage.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//
import SwiftUI

struct StudentHomePage: View {
    
    @State var showMenu: Bool = false
    @State var showCreate: Bool = false
    @State var animatePath: Bool = false
    @State var animateBG: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    StudentNavigationBar(showMenu: $showMenu, showCreate: $showCreate, animatePath: $animatePath, animateBG: $animateBG)
                    
                    sherText
                        .padding(.top,90)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.white)
                Color.black
                    .opacity(animateBG ? 0.25 : 0)
                    .ignoresSafeArea()
                StudentMenuLeftView(showMenu: $showMenu, animatePath: $animatePath, animateBG: $animateBG)
                    .offset(x: showMenu ? 0 : -getRect().width)
            }
            .navigationBarHidden(true)
        }
    }
}

struct StudentHomePage_Previews: PreviewProvider {
    static var previews: some View {
        StudentHomePage()
    }
}

extension StudentHomePage {
    private var sherText: some View {
        VStack {
            Text(
"""
Yer yuzi bir dashtu sabro bo'lsa, gulzori ilm,
Sahnai olamni bo'lmoqda namudori ilm.
Ilmu fan birla qurollanmoqda sardori ilm,
Ilmi yo’q, xech bir jonga yetkurmaydi ozor ilm.
""")
                .font(.headline)
        }
        
    }
}
