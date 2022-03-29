//
//  choicePage.swift
//  MyNewProject
// TANLASH SAHIFASI
//  Created by Firdavs Boltayev on 19/12/21.
//

import SwiftUI

struct choicePage: View {
    @State var showSheet: Bool = false
    @State var teachAnimate: Bool = false
    @State var studAnimate: Bool = false
    @AppStorage("studentSignIn") var studSign: Bool = false
    var body: some View {
        
        VStack {
            HStack {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .frame(width: 130, height: 140)
                        .cornerRadius(10)
                        .foregroundColor(teachAnimate ? Color("choiceBackColor").opacity(0.7) :  Color("viewColor"))
                        .cornerRadius(13)
                    Image("teacher-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .offset(x: 5, y: teachAnimate ? -35 : 0)
                        .onTapGesture {
                            withAnimation {
                                if studAnimate == false {
                                    teachAnimate.toggle()
                                } else if studAnimate == true {
                                    teachAnimate.toggle()
                                    studAnimate = false
                                }
                            }
                        }
                }
                
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .frame(width: 130, height: 140)
                        .foregroundColor(studAnimate ? Color("choiceBackColor").opacity(0.7) :  Color("viewColor"))
                        .cornerRadius(13)
                    Image("student-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .offset(x: 0, y: studAnimate ? -35 : 0)
                        .onTapGesture {
                            withAnimation {
                                if teachAnimate == false {
                                    studAnimate.toggle()
                                } else if teachAnimate == true {
                                    studAnimate.toggle()
                                    teachAnimate = false
                                }
                            }
                        }
                }
            }
            Button(action: {
                if teachAnimate {
                    showSheet.toggle()
                } else if studAnimate {
                    studSign = true
                }
            }, label: {
                ZStack {
                    Text(teachAnimate ? "O'qituvchi" : "")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: teachAnimate ?  UIScreen.main.bounds.width - 30 : 0, height: 35)
                        .background(Color("choiceButton"))
                        .font(.headline)
                        .cornerRadius(8)
                    
                    Text(studAnimate ? "Student" : "" )
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: studAnimate ? UIScreen.main.bounds.width - 30 : 0, height: 35)
                        .background(teachAnimate ? nil : Color("choiceButton"))
                        .cornerRadius(8)
                }
            })
                .shadow(color: Color("choiceButton").opacity(0.4), radius: 10, x: -10, y: -10)
                .padding()
                .sheet(isPresented: $showSheet) { LoginIN() }
        }
    }
}

struct choicePage_Previews: PreviewProvider {
    static var previews: some View {
        choicePage()
            .preferredColorScheme(.dark)
    }
}
