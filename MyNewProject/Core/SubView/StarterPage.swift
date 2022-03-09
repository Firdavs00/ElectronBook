//
//  StarterPage.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/01/22.
//

import SwiftUI

struct StarterPage: View {

    @State var studentStatus = UserDefaults.standard.value(forKey: "studentStatus") as? Bool ?? false
    @State var teacherStatus = UserDefaults.standard.value(forKey: "teacherStatus") as? Bool ?? false
    
    init() {
        
    }
    
    var body: some View {
        VStack {
            if self.teacherStatus {
                TeacherHomePage()
            } else   if self.studentStatus {
                StudentHomePage()
            } else {
                choicePage()
            }
        }
        .onAppear {
            let nameUserDefault = NSNotification.Name("teacherStatus")
            NotificationCenter.default.addObserver(forName: nameUserDefault, object: nil, queue: .main) { (_) in
                print("Teacher Call NotificationCenter")
                self.teacherStatus = UserDefaults.standard.value(forKey: "teacherStatus") as? Bool ?? false }
            
            let name = NSNotification.Name("studentStatus")
            NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) { (_) in
                print("Student Call NotificationCenter")
                self.studentStatus = UserDefaults.standard.value(forKey: "studentStatus") as? Bool ?? false }
        }
    }
}

struct StarterPage_Previews: PreviewProvider {
    static var previews: some View {
        StarterPage()
    }
}
