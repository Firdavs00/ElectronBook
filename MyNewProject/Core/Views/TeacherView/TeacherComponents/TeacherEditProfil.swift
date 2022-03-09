//
//  TeacherEditProfil.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 05/03/22.
//

import SwiftUI

struct TeacherEditProfil: View {
    
    @State var defImage = UIImage(imageLiteralResourceName: "camera")
    @State var isShowPicker: Bool = false
    @State var image: UIImage? = nil
    
    @Environment(\.presentationMode) var mode
    @State var surname = ""
    @State var name = ""
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.blue)
                })
                Spacer()
                Text("Edit Profile")
                    .font(.headline)
                Spacer()
                Button(action: {
                    mode.wrappedValue.dismiss()

                }, label: {
                    if surname == "" && name == "" {
                        Image(systemName: "checkmark")
                            .foregroundColor(.red)
                            .hidden()
                    } else {
                        Image(systemName: "checkmark")
                            .foregroundColor(.red)
                    }
                   
                })
            }
            .padding(.horizontal)
            Divider()
            Button(action: {
                withAnimation {
                    self.isShowPicker.toggle()
                }
            }) {
                Image(uiImage: image ?? defImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(image: $image, isShown: $isShowPicker)
            }
            VStack(alignment: .leading, spacing: 15){
                TextField("Surname", text: $surname )
                    .font(.system(size: 18))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(1)
                    .padding(.horizontal)
                TextField("Name", text: $name )
                    .font(.system(size: 18))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .lineLimit(1)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.top)
    }
}

struct TeacherEditProfil_Previews: PreviewProvider {
    static var previews: some View {
        TeacherEditProfil()
    }
}


