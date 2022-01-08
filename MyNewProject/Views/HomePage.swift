//
//  HomePage.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import SwiftUI

struct HomePage: View {
    
    @State var showMenu: Bool = false
    @State var showCreate: Bool = false
    @State var animatePath: Bool = false
    @State var animateBG: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    navBar
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(LinearGradient(gradient: Gradient(colors: [.green.opacity(0.6), .blue.opacity(0.6)]), startPoint: .trailing, endPoint: .leading))
                
                Color.black
                    .opacity(animateBG ? 0.25 : 0)
                    .ignoresSafeArea()
                MenuView(showMenu: $showMenu, animatePath: $animatePath, animateBG: $animateBG)
                    .offset(x: showMenu ? 0 : -getRect().width)
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

extension HomePage {
    
    private var navBar: some View {
        
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
                    Image("menu")
                        .padding(.leading)
                }
                Spacer()
                Text("O'quv Darsliklari")
                    .font(.headline)
                
                Spacer()
                Button {
                    showCreate.toggle()
                } label: {
                    Image("create")
                        .padding(.trailing)
                }
                .sheet(isPresented: $showCreate, content: {
                    CreateView()
                })
            }
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.black)
        }
        .padding(.top,40)
    }
}

struct MenuView: View {
    @Binding var showMenu: Bool
    @Binding var animatePath: Bool
    @Binding var animateBG: Bool
    @State var isLoading = false
    @EnvironmentObject var session: SessionStore
    func doSignOut(){
           isLoading = true
           if SessionStore().signOut() {
               isLoading = false
               session.listen()
           }
       }
    var body: some View {
        ZStack {
            // Blur View...
            BlurView(style: .systemUltraThinMaterialDark)
            
            // Content...
            VStack(alignment: .leading, spacing: 25) {
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
                    Image(systemName: "xmark.circle")
                        .font(.title)
                }
                .foregroundColor(Color.white.opacity(0.8))
                Spacer()
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
                    doSignOut()
                }, label: {
                    HStack(spacing:0){
                        Image("outPut")
                    Text("LOGOUT")
                        .padding()
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                    }
                    .padding(.leading)
                })
            }
            .padding(.trailing, 120)
            .padding()
            .padding(.top, getSafeArea().top)
            .padding(.bottom, getSafeArea().bottom)
            .frame(maxWidth:.infinity,maxHeight: .infinity, alignment: .topLeading)
        }
        .clipShape(MenuShape(value: animatePath ? 150 : 0))
        .background(
            MenuShape(value: animatePath ? 150 : 0)
                .stroke(
                    .linearGradient(.init(colors:
                                            [.blue,
                                             .blue.opacity(0.7),
                                             .blue.opacity(0.5),
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
