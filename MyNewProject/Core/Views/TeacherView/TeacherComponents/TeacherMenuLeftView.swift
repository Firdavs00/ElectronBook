//
//  MenuLeftView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct TeacherMenuLeftView: View {
    
    @EnvironmentObject var vm: LoginViewModel
    @Binding var showMenu: Bool
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    @State var showEdit = false
    
    var body: some View {
        
        ZStack {
            // Blur View...
            if animateBG  {
                menu
            } else {
                menu.hidden()
            }
            
            // Content...
            VStack(alignment: .leading, spacing: 0) {
                
                profile
//                    .onAppear {
//                        vm.postLogin(email: vm.email, password: vm.password)
//                    }
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.5))
               
                teachCategory
            }
            .padding(.trailing, 105)
            .padding(.top, getSafeArea().top)
            .padding(.bottom, getSafeArea().bottom)
            .frame(maxWidth:.infinity,maxHeight: .infinity, alignment: .topLeading)
        }
        .clipShape(MenuShape(value: animatePath ? 150 : 0))
        .background(
            MenuShape(value: animatePath ? 150 : 0)
                .stroke(
                    .linearGradient(.init(colors:
                                            [.red,
                                             .blue.opacity(0.7),
                                             .red.opacity(0.5),
                                             Color.clear]),
                                    startPoint: .top,
                                    endPoint: .bottom),
                    lineWidth: animatePath ? 7 : 0
                )
                .padding(.leading, -50)
        )
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct TeacherMenuLeftView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherMenuLeftView(showMenu: .constant(true), animatePath: .constant(true), animateBG: .constant(true))
    }
}

extension TeacherMenuLeftView {
    
    private var menu: some View {

        BlurView(style: .systemThinMaterialLight)
            .onTapGesture {
                withAnimation(
                    .interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)) {
                        animatePath.toggle()
                    }
                withAnimation {
                    animateBG.toggle()
                }
                withAnimation(.spring().delay(0.1)) {
                    showMenu.toggle()
                }
            }
    }
    
    private var profile: some View {
        
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "camera.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(vm.user?.first_name ?? "No firstName ")//"Surname"
                    .font(.system(size: 18))
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text(vm.user?.last_name ?? "No lastName")//"Name"
                    .font(.system(size: 18))
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            Spacer()
            
            Button(action: {
                showEdit.toggle() },
                label: {
                Image(systemName: "pencil.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 35))
            })
                .padding(.trailing)
                .fullScreenCover(isPresented: $showEdit) {
                TeacherEditProfil()
            }
        }
       
    }
    
    private var teachCategory: some View {
        VStack(alignment: .leading){
            Spacer()
            HStack {
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "teacherStatus")
                    NotificationCenter.default.post(name: Notification.Name("teacherStatus"), object: nil)
                    UserDefaults.standard.removeObject(forKey: "token")
                }, label: {
                    HStack(spacing:0){
                        Image("outPut")
                        Text("LOGOUT")
                            .font(.headline)
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                            .padding(.leading)
                    }
                    .padding()
                })
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
