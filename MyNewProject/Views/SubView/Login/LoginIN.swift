//
//  LoginIN.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import SwiftUI

struct LoginIN: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentationMode
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    func doSignIn(){
          isLoading = true
          SessionStore().signIn(email: email, password: password, handler: {(res,err) in
              isLoading = false
              if err != nil {
                  print("Check email or password")
                  return
              }
              print("User signed in")
              session.listen()
          })
      }
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            VStack (spacing: 0){
                Image("images")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("You are a teacher!")
            }
            TextField("Login", text: $email)
                .frame(height: 40)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red))
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
            
            SecureField("Password", text: $password)
                .frame(height: 40)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red))
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
            if email != "laylokadirova@gmail.com" && password != "123456789" {
                Button(action: {
                    doSignIn()
                   
                }, label: {
                    Text("Login In")
                        .frame(width: UIScreen.main.bounds.width - 27, height: 40)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                    
                })
            }
          
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
