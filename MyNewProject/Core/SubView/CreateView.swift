//
//  CreateView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 23/12/21.
//

import SwiftUI

struct CreateView: View {
    
    @State var mavzuName = ""
    @State var fileName = ""
    @State var openFile = false

    var body: some View {
        VStack {
            VStack {
                VStack (alignment:.leading,spacing: 4) {
                    Text("Mavzu nomi:")
                        .font(.headline)
                    TextEditor(text: $mavzuName)
                        .frame( height: 60)
                        .cornerRadius(7)
                        .shadow(radius: 10)
                }
                .padding()
                
                VStack (alignment: .leading, spacing: 4) {
                    Text("File yuklang! (pdf)")
                        .font(.headline)
                    HStack {
                        Text(fileName)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: 80)
                    .background(Color.white)
                    .cornerRadius(7)
                    .shadow(radius: 10)
                    
                    Button(action: {
                        openFile.toggle()
                    }, label: {
                        HStack {
                            Text("Fayl Tanlang!")
                                .frame(width: UIScreen.main.bounds.width - 30, height: 30)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(7)
                                .shadow(radius: 10)
                        }
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
                        .padding(.top,10)
                }
                .padding(.bottom).padding(.horizontal)
                Spacer()
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.green.opacity(0.6), .blue.opacity(0.6)]), startPoint: .trailing, endPoint: .leading))
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
