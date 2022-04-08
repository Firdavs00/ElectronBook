//
//  ListView.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 08/04/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            HStack {
                Group {
                    Spacer()
                    Text("Mavzu nomi")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 1, height: 20)
                    
                    Spacer()
                    
                    Text("O'qituvchi nomi")
                        .fontWeight(.bold)
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 1, height: 20)

                    Spacer()
                }
                
                Text("Yaratilgan sana")
                    .fontWeight(.bold)
                Spacer()
            }
            Divider()
                .background(Color.black)
            
            Spacer()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
