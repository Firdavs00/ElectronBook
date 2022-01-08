//
//  StarterPage.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/01/22.
//

import SwiftUI

struct StarterPage: View {
    @EnvironmentObject var session: SessionStore
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        VStack {
            if self.status || self.session.session != nil {
                HomePage()
            } else {
                choicePage()
            }
        }
        .onAppear {
            session.listen()
            let name = NSNotification.Name("status")
            NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main){ (_) in
                print("Call NotificationCenter")
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false}
            
        }
    }
}

struct StarterPage_Previews: PreviewProvider {
    static var previews: some View {
        StarterPage()
    }
}
