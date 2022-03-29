//
//  StudentMenuLeftView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct StudentMenuLeftView: View {
    
    @AppStorage("studentSignIn") var studSign: Bool = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @State private var offset: CGFloat = 180
    @Binding var showMenu: Bool
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            // Blur View...
            if animateBG  {
                menu
            } else {
                menu.hidden()
            }
            
          // Content...
            VStack(alignment: .leading, spacing: 25) {
               
                studCategory
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

struct StudentMenuLeftView_Previews: PreviewProvider {
    static var previews: some View {
        StudentMenuLeftView(showMenu: .constant(true), animatePath: .constant(true), animateBG: .constant(true))
    }
}

extension StudentMenuLeftView {
    
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
    private var studCategory: some View {
        
        VStack(alignment: .leading,spacing: 0) {
            VStack {
                HStack(alignment:.top) {
                    Image("logo")
                        .frame(width: 80, height: 80)
                        .shadow(color: Color.green.opacity(0.5), radius: 10, x: -5, y: 10)
                        .padding(.top).padding(.leading,70)
                    Spacer()
                    Image(systemName: isDarkMode ? "sun.max.fill" : "moon.stars.fill")
                        .font(.system(size: 24))
                        .animation(Animation.linear(duration: 10), value: offset)
                        .foregroundColor(Color.white)
                        .padding(.trailing,25)
                        .onTapGesture {
                            if isDarkMode {
                                isDarkMode = false
                            } else {
                                isDarkMode = true
                            }
                        }
                }
            }
            .padding(.bottom).padding(.trailing)
            .background(Color("profilBackColor"))
            Divider()
                .background(isDarkMode ? .white : .black)
            Spacer()
            
            Button(action: {
                          studSign = false
                      }, label: {
                          HStack(spacing:0){
                              Image(systemName: "arrow.backward.square")
                                  .foregroundColor(Color("categoryIconColor"))
                          Text("Logout")
                              .font(.headline)
                              .fontWeight(.heavy)
                              .foregroundColor(Color("basicTitlesColor"))
                              .padding(.leading,5)
                          }
                          .padding()
                      })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("categoryBackColor").opacity(0.9))
    }
}


