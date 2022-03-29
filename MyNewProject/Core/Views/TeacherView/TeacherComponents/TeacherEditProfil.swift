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
    @FocusState private var surNameFocus: Bool
    @FocusState private var nameFocus: Bool
    @State private var surname = ""
    @State private var name = ""
    
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
                    .foregroundColor(Color("basicTitlesColor"))
                Spacer()
                if surname.isEmpty || name.isEmpty {
                    Button(action: {
                        editProfil()
                    }, label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.red)
                    })
                     .hidden()
                } else {
                    Button(action: {
                        editProfil()
                    }, label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.red)
                    })
                }
            }
            .padding(.horizontal)
            Divider()
            Button(action: {
                withAnimation {
                    self.isShowPicker.toggle()
                }
            }) {
                VStack {
                    Image(uiImage: image ?? defImage)
                        .resizable()
                        .clipShape(Circle())
                }
                .background(Color("imageAcsentColor"))
                .frame(width: 80, height: 80)
                .cornerRadius(80)
            }
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(image: $image, isShown: $isShowPicker)
            }
            VStack(alignment: .leading, spacing: 15){
                FirstResponderTextField(
                    text: $surname, placeholder: "Surname")
                    .focused($surNameFocus)
                    .frame(height: 40)
                    .padding(.leading)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("textFaildBorderColor")))
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                SuperTextField(
                    text: $name, placeholder: Text("Name").foregroundColor(.gray.opacity(0.7)))
                    .focused($nameFocus)
                    .frame(height: 40)
                    .padding(.leading)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("textFaildBorderColor")))
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding(.horizontal).padding(.top,5)
            Spacer()
        }
        .background(Color("viewColor"))
        .padding(.top)
    }
}

struct TeacherEditProfil_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TeacherEditProfil()
        }
    }
}

extension TeacherEditProfil {
    func editProfil() {
        let firstName = !surNameFocus.description.isEmpty
        let lastName = !nameFocus.description.isEmpty
        if firstName && lastName {
            surNameFocus = false
            nameFocus = true
        } else {
            surNameFocus = true
            nameFocus = false
        }
        if !surname.isEmpty && !name.isEmpty {
            mode.wrappedValue.dismiss()
            
        }
    }
}
