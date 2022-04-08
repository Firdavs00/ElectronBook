//
//  Maruzalar.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 02/04/22.
//

import SwiftUI

struct LectureAddTeacherView: View {
    
    @State var isAnimateKafedra: Bool = false
    @State var isAnimateSubject: Bool = false
    @State var lectureName = ""
    @State var teacherName = ""
    @State var fileName: String?
    @State var openFile = false
    
    var body: some View {
        
        VStack {
            HStack {
                
                    Text("Kafedra tanlov")
                    .font(.custom("PublicSans-Regular", size: 17))
                    .foregroundColor(Color(hex: "#445975"))
                
                    Spacer()
                    
                    Button(action: {
                        isAnimateKafedra.toggle()
                    }, label: {
                        
                        Image(systemName: isAnimateKafedra ? "chevron.down" : "chevron.right")
                            .foregroundColor(.blue)
                            .animation(Animation.spring())
                    })
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
            .padding(.horizontal)
            
            HStack {
                ZStack(alignment: .top) {
                    
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5))
                        .background(Color.gray.opacity(0.1))
                    
                    if isAnimateKafedra {
                        ScrollView {
                            VStack {
                                
                                Text("dfghl")
//                                    .font(.custom("PublicSans-Regular", size: 16))
                                    .foregroundColor(Color(hex: "#697A8D"))
                                
                                Divider()
                                
                                Text("dfghl")
//                                    .font(.custom("PublicSans-Regular", size: 16))
                                    .foregroundColor(Color(hex: "#697A8D"))

                                Divider()
                                
                                Text("dfghl")
//                                    .font(.custom("PublicSans-Regular", size: 16))
                                    .foregroundColor(Color(hex: "#697A8D"))

                                Divider()
                            }
                            .padding(.top,8)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: isAnimateKafedra ? 250 : 0)
                .animation(Animation.easeOut(duration: 0.3))
                .padding(.top, -8)
            }

            HStack {
                
                Text("Fan tanlov")
                    .font(.custom("PublicSans-Regular", size: 17))
                    .foregroundColor(Color(hex: "#445975"))
                
                Spacer()
                
                Button(action: {
                    isAnimateSubject.toggle()
                }, label: {
                    
                    Image(systemName: isAnimateSubject ? "chevron.down" : "chevron.right")
                        .foregroundColor(.blue)
                })
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
            .padding(.horizontal)
//            .hidden()
            
            HStack {
                ZStack(alignment: .top) {
                    
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5))
                        .background(Color.gray.opacity(0.1))
                    
                    if  isAnimateSubject {
                        ScrollView {
                            VStack {
                                
                                Text("dfghl")
                                
                                Divider()
                                
                                Text("dfghl")
                                
                                Divider()
                                
                                Text("dfghl")
                                Divider()
                            }
                            .padding(.top,8)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: isAnimateSubject ? 250 : 0)
                .animation(Animation.easeOut(duration: 0.3))
                .padding(.top, -8)
            }
            createLecture
                .padding()
           Spacer()
        }
        .navigationTitle("Maruzalar")
    }
}

struct MaruzalarView_Previews: PreviewProvider {
    static var previews: some View {
        
LectureAddTeacherView()
    }
}

extension LectureAddTeacherView {
    
    private var createLecture: some View {
        
        VStack {
            HStack {
                Text("Mavzu nomi")
                    .bold()
                Spacer()
            }
            TextField("Nomi", text: $lectureName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3)))
            
            HStack {
                Text("O'qituvchi ismi")
                    .bold()
                Spacer()
            }
            .padding(.top)
            
            TextField("Ismi", text: $teacherName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3)))
            
            HStack {
                Text(fileName ?? "Fayl")
                    .padding(10)
                
                Spacer()
                
                Button(action: {
                    openFile.toggle()
                }, label: {
                    Text("Browse")
                        .padding(10)
                        .background(Color(hex: "EAECEF"))
                })
                    .fileImporter(isPresented: $openFile, allowedContentTypes: [.pdf]) { res in
                        do {
                            let fileUrl = try res.get()
                            print(fileUrl)

                            self.fileName = fileUrl.lastPathComponent
                        }
                        catch {
                            print("error reading docs")
                            print(error.localizedDescription)
                        }
                    }
            }
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3)))
            .padding(.top)
            
            Button(action: {
               
            }, label: {
                HStack {
                    Spacer()
                    Image(systemName: "doc.badge.plus")
                        .foregroundColor(.white)
                    Text("Saqlamoq")
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(10)
            })
            .background(Color.blue)
            .cornerRadius(5)
            .padding(.top)
        }
    }
}
