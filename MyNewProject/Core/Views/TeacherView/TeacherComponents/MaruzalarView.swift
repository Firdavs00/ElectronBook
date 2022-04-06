//
//  Maruzalar.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 02/04/22.
//

import SwiftUI

struct MaruzalarView: View {
    
    @State var isAnimateFakultet: Bool = false
    @State var isAnimateFan: Bool = false

    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Fakultet tanlov")
                    .foregroundColor(Color(hex: "#445975"))
                
                Button(action: {
                    
                    isAnimateFakultet.toggle()
                    
                }, label: {
                    
                    Image(systemName: isAnimateFakultet ? "chevron.down" : "chevron.right")
                        .foregroundColor(.blue)
                })
                
                Spacer()
                
                Text("Fan tanlov")
                    .fontWeight(.medium)
                
                Image(systemName: isAnimateFan ? "chevron.down" : "chevron.right")
                    .foregroundColor(.blue)  
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.gray.opacity(0.5)))
            .padding(.horizontal)
            
            HStack {
                
                ZStack(alignment: .top) {
                    
                    RoundedRectangle(cornerRadius: 0).stroke()
                    
                    if isAnimateFakultet {
                        
                        ScrollView {
                            
                            VStack {
                                
                                Text("dfghl")
                                
                                Divider()
                                
                                Text("dfghl")
                                
                                Divider()
                                
                                Text("dfghl")
                            }
                            .padding(.top,8)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 2 - 50, height: isAnimateFakultet ? 200 : 0)
                .animation(Animation.default)
                .padding(.top, -8)
                
                Spacer()
                
            }
            .padding(.leading)
            
           Spacer()
        }
        .navigationTitle("Maruzalar")
    }
}

struct MaruzalarView_Previews: PreviewProvider {
    static var previews: some View {
        MaruzalarView()
    }
}
