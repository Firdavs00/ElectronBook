//
//  MenuLeftView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct TeacherMenuLeftView: View {
    
    @AppStorage("teacherSignIn") var teachSign: Bool = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @State private var offset: CGFloat = 180
    
    @State var action =  false
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
                    .padding(.horizontal).padding(.bottom,5)
                    .background(Color("profilBackColor"))
                
                teachCategory
                
                if action {
                    NavigationLink(destination:
                                    LectureAddTeacherView(), isActive: $action){}
                }
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
                                            [Color("menuShape1"),
                                             Color("menuShape2").opacity(0.7),
                                             Color("menuShape1").opacity(0.5),
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
        
        BlurView(style: .systemMaterialDark)
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
        
        VStack(alignment: .leading, spacing: 4) {
            
            HStack(alignment: .top) {
                
                Image(systemName: "camera.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: isDarkMode ? "sun.max.fill" : "moon.stars.fill")
                    .font(.system(size: 24))
                    .animation(Animation.linear(duration: 10), value: offset)
                    .foregroundColor(Color.white)
                    .padding(.trailing).padding(.top,5)
                    .onTapGesture {
                        
                        if isDarkMode {
                            
                            isDarkMode = false
                            
                        } else {
                            
                            isDarkMode = true
                        }
                    }
            }
            
            HStack {
                
                Text("Surname")//"Surname"
                    .font(.custom("PublicSans-Thin_Medium", size: 18))
                    .foregroundColor(Color("profilTitleColor"))
                    .lineLimit(1)
                
                Text("Name" )//"Name"
                    .font(.custom("PublicSans-Thin_Medium", size: 18))
                    .foregroundColor(Color("profilTitleColor"))
                    .lineLimit(1)
                
                Spacer()
                
                Button(action: {
                    
                    showEdit.toggle()
                    
                },
                       label: {
                    
                    Image(systemName: "pencil.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 28))
                })
                .padding(.trailing,10)
                .fullScreenCover(isPresented: $showEdit) {
                    
                    TeacherEditProfil()
                }
            }
        }
    }
    
    private var teachCategory: some View {
        VStack(alignment: .leading){
            
            
            //.......
            Button(action: {
                action = true
            }, label: {
                HStack {
                    Image(systemName: "text.book.closed.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "#435971"))
                        .padding(8)
                    Text("Maruzalar")
                        .font(.custom("PublicSans-Regular", size: 17))
                        .foregroundColor(Color(hex: "#697A8D"))
                    Spacer()
                }
            })
            .frame(width: 250)
            .background(Color.white)
            .overlay(Rectangle().stroke(Color.white,lineWidth: 1))
            .cornerRadius(8)
            .shadow(color: Color.blue.opacity(0.4), radius: 8, x: -5, y: 8)
            .padding().padding(.top)
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image("test")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.red)
                    //                        .foregroundColor(Color(hex: "#435971"))
                        .padding(8)
                    Text("Testlar")
                        .font(.custom("PublicSans-Regular", size: 17))
                        .foregroundColor(Color(hex: "#697A8D"))
                    Spacer()
                }
            })
            .frame(width: 250)
            .background(Color.white)
            .overlay(Rectangle().stroke(Color.white,lineWidth: 1))
            .cornerRadius(8)
            .shadow(color: Color.blue.opacity(0.4), radius: 8, x: -5, y: 8)
            .padding()
            Spacer()
            HStack {
                Button(action: {
                    teachSign = false
                    UserDefaults.standard.removeObject(forKey: "token")
                }, label: {
                    HStack {
                        Image(systemName: "arrow.backward.square")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: "#435971"))
                            .padding(8)
                        Text("Logout")
                            .font(.custom("PublicSans-Regular", size: 17))
                            .foregroundColor(Color(hex: "#697A8D"))
                        Spacer()
                    }
                })
                .frame(width: 150)
                .background(Color.white)
                .overlay(Rectangle().stroke(Color.white,lineWidth: 1))
                .cornerRadius(8)
                .shadow(color: Color.blue.opacity(0.4), radius: 8, x: -5, y: 8)
                .padding()
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("categoryBackColor").opacity(0.9))
    }
}

//                Button(action: {
//                    teachSign = false
//                    UserDefaults.standard.removeObject(forKey: "token")
//                }, label: {
//                    HStack(spacing:0){
//                        Image(systemName: "arrow.backward.square")
//                            .foregroundColor(Color("categoryIconColor"))
//                        Text("Logout")
//                            .font(.headline)
//                            .fontWeight(.heavy)
//                            .foregroundColor(Color("basicTitlesColor"))
//                            .padding(.leading,5)
//                    }
//                    .padding()
//                })
