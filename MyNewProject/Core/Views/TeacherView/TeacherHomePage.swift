//
//  HomePage.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import SwiftUI

struct TeacherHomePage: View {
    @StateObject var vm = LoginViewModel()
    @State var showMenu: Bool = false
    @State var showCreate: Bool = false
    @State var animatePath: Bool = false
    @State var animateBG: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TeacherNavigationBar(showMenu: $showMenu, showCreate: $showCreate, animatePath: $animatePath, animateBG: $animateBG)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                Color.black
                    .opacity(animateBG ? 0.25 : 0)
                    .ignoresSafeArea()
                TeacherMenuLeftView(showMenu: $showMenu, animatePath: $animatePath, animateBG: $animateBG).environmentObject(vm)
                    .offset(x: showMenu ? 0 : -getRect().width )
            }
            .navigationBarHidden(true)
        }
    }
}

struct TeacherHomePage_Previews: PreviewProvider {
    static var previews: some View {
        TeacherHomePage()
    }
}

