//
//  StarterPage.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/01/22.
//

import SwiftUI

struct StarterPage: View {

    @AppStorage("studentSignIn") var studSign: Bool = false
    @AppStorage("teacherSignIn") var teachSign: Bool = false
    
    init() { }
    
    var body: some View {
        NavigationView {
            VStack {
                if self.teachSign {
                    
                    TeacherHomePage()
                    
                } else   if self.studSign {
                    
                    StudentHomePage()
                    
                } else {
                    
                    ChoicePage()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct StarterPage_Previews: PreviewProvider {
    static var previews: some View {
        StarterPage()
    }
}
