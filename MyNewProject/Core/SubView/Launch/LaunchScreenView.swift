//
//  LaunchScreenView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/03/22.
//

import SwiftUI

struct LaunchScreenView: View { //Elektron darslik yuklanmoqda...
  
    @State private var loadingText: [String] = "Electronic textbook is loading...".map{ String($0) }
    @State private var showLoadingText: Bool = false
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("viewColor")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("Tatulogo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                
                ZStack {
                    
                    if showLoadingText {
                        
                        HStack(spacing: 0) {
                            
                            ForEach(loadingText.indices) { index in
                                
                                Text(loadingText[index])
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("basicTitlesColor"))
                                    .offset(y: counter == index ? -5 : 0)
                            }
                        }
                        .transition(AnyTransition.scale.animation(.easeIn))
                    }
                }
                
                Spacer()
                
            }.padding(.bottom,80)
        }
        .onAppear {
            
            showLoadingText.toggle()
            
        }
        .onReceive(timer, perform: { _ in
            
            withAnimation(.spring()) {
                
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    
                    counter = 0
                    loops += 1
                    
                    if loops >= 2 {
                        
                        showLaunchView = false
                    }
                } else {
                    
                    counter += 1
                }
            }
        })
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView(showLaunchView: .constant(true))
            .preferredColorScheme(.dark)
    }
}
