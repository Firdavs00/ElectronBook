//
//  LoginIN.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import SwiftUI
import AlertToast
struct LoginIN: View {
    @StateObject var vm = LoginViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State var action: Bool = false
    @State var toast: Bool = false
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            VStack (spacing: 0){
                Image("images")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("You are a teacher!")
            }
            TextField("Login", text: $vm.email)
                .frame(height: 40)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red))
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)
            
            SecureField("Password", text: $vm.password)
                .frame(height: 40)
                .padding(.leading)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.red))
                .background(Color.red.opacity(0.1))
                .cornerRadius(8)

                Button(action: {

                    vm.postLogin(email: vm.email, password: vm.password)
                        
                    if vm.isErrorCode401 == true {
                    toast = true
                    }
                   
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
        .toast(isPresenting: $toast, duration: 1.5, tapToDismiss: true, alert: {
            AlertToast(type: .error(.red), title: Optional("Xatolik"), subTitle: Optional("Email yoki parol xato"))
        })
        
    }
}

struct LoginIN_Previews: PreviewProvider {
    static var previews: some View {
        LoginIN()
    }
}
