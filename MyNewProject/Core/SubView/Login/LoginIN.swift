//
//  LoginIN.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 22/12/21.
//

import SwiftUI
//import AlertToast
struct LoginIN: View {
    
    @StateObject var vm = LoginViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @FocusState private var emailInFocus: Bool
    @FocusState private var passwordInFocus: Bool
    @State var action: Bool = false
    @State var toast: Bool = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                Spacer()
                VStack (spacing: 0){
                    Image("user-icon")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                    Text("You are a teacher!")
                        .foregroundColor(Color("basicTitlesColor"))
                }
                FirstResponderTextField(
                    text: $vm.email, placeholder: "Login")
                    .focused($emailInFocus)
                    .frame(height: 40)
                    .padding(.leading)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("textFaildBorderColor")))
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                
                SecureTextField(
                    text: $vm.password, placeholder: Text("Password").foregroundColor(.gray.opacity(0.7)))
                    .focused($passwordInFocus)
                    .frame(height: 40)
                    .padding(.leading)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("textFaildBorderColor")))
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                
                Button(action: {
                    sign()
                    //                    if vm.isErrorCode401 == true {
                    //                    toast = true
                    //                    }
                }, label: {
                    Text("Login In")
                        .frame(width: UIScreen.main.bounds.width - 27, height: 40)
                        .foregroundColor(.white)
                        .background(Color("lognInColor"))
                        .cornerRadius(8)
                })
                Spacer()
            }
            .padding()
            if vm.isLoading {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                ProgresView()
            }
        }
//        .toast(isPresenting: $toast, duration: 1.5, tapToDismiss: true, alert: {
//            AlertToast(type: .error(.red), title: Optional("Xatolik"), subTitle: Optional("Email yoki parol xato"))
//        })
    }
}

struct LoginIN_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            LoginIN()
        }
    }
}

extension LoginIN {
    func sign() {
        let emailIsValied = !emailInFocus.description.isEmpty
        let passwordIsValied = !passwordInFocus.description.isEmpty
        if emailIsValied && passwordIsValied {
            emailInFocus = false
            passwordInFocus = true
        } else {
            emailInFocus = true
            passwordInFocus = false
        }
        vm.postLogin(email: vm.email, password: vm.password)
    }
}
