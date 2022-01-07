//
//  choicePage.swift
//  MyNewProject
// TANLASH SAHIFASI
//  Created by Firdavs Boltayev on 19/12/21.
//

import SwiftUI

struct choicePage: View {
    @State var showSheet: Bool = false
    var body: some View {
        VStack {
            HStack {
                
                Image("teacher")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 40)
                
                Image("student")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
            }
            HStack (spacing: 80){
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Text("Teacher")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 100, height: 30)
                        .background(Color.blue)
                        .cornerRadius(10)
                }).sheet(isPresented: $showSheet) {
                    LoginIN()
                }
                
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
                    
                }, label: {
                    Text("Student")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 100, height: 30)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.leading)
                })
                
            }.padding(.leading)
        }
    }
}

struct choicePage_Previews: PreviewProvider {
    static var previews: some View {
        choicePage()
    }
}
