//
//  LectureDownloadStudentView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 08/04/22.
//

import SwiftUI

struct LectureDownloadStudentView: View {
    
    @State var isAnimateKafedra: Bool = false
    @State var isAnimateSubject: Bool = false
    
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
            .animation(Animation.spring())

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
           Spacer()
        }
        .navigationTitle("Maruzalar")
    }
}

struct LectureDownloadStudentView_Previews: PreviewProvider {
    static var previews: some View {
        LectureDownloadStudentView()
    }
}
