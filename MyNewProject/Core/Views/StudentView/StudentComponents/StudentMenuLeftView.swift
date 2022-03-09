//
//  StudentMenuLeftView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 03/03/22.
//

import SwiftUI

struct StudentMenuLeftView: View {
    
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

struct StudentMenuLeftView_Previews: PreviewProvider {
    static var previews: some View {
        StudentMenuLeftView(showMenu: .constant(true), animatePath: .constant(true), animateBG: .constant(true))
    }
}

extension StudentMenuLeftView {
    
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
    private var studCategory: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Button {
                
                    // Closing Menu...
                
                    // Animating Path with little Dwlay...
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
                } label: {
                    Image(systemName: "arrow.backward")
                        .font(.headline)
                }
                .foregroundColor(Color.blue)
                .padding(.leading)
                Spacer()
            }
            
            HStack {
                Image("logo")
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.green.opacity(0.5), radius: 10, x: -5, y: 10)
                    .padding(.top).padding(.leading,70)
                Spacer()
            }
            Spacer()
            Button(action: {
                UserDefaults.standard.set(false, forKey: "studentStatus")
                NotificationCenter.default.post(name: Notification.Name("studentStatus"), object: nil)
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}


//Button {
//
//    // Closing Menu...
//
//    // Animating Path with little Dwlay...
//    withAnimation(
//        .interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)) {
//            animatePath.toggle()
//        }
//    withAnimation {
//        animateBG.toggle()
//    }
//    withAnimation(.spring().delay(0.1)) {
//        showMenu.toggle()
//    }
//} label: {
//    Image(systemName: "xmark.circle")
//        .font(.title)
//}
//.foregroundColor(Color.white.opacity(0.8))
