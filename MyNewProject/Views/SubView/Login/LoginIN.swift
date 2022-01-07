//
//  LoginIN.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import SwiftUI

struct LoginIN: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var login = ""
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            VStack (spacing: 0){
                Image("images")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("You are a teacher!")
            }
            TextField("Login", text: $login)
                .frame(height: 40)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red))
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
            
            SecureField("Password", text: $login)
                .frame(height: 40)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red))
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Login In")
                    .frame(width: UIScreen.main.bounds.width - 27, height: 40)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(8)
                
            })
            Spacer()
        }
        .padding()
        
    }
}

struct LoginIN_Previews: PreviewProvider {
    static var previews: some View {
        LoginIN()
    }
}
