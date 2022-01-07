//
//  MyNewProjectApp.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 19/12/21.
//

import SwiftUI
import Firebase

@main


struct MyNewProjectApp: App {
   
    @UIAplicationDelegateAdaptor(AppDelegate.self) var appDelegate
 
    var body: some Scene {
        WindowGroup {
            StarterPage()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
