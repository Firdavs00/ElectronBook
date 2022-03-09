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
var vm = UserDefaults()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showLaunchView: Bool = true
    var body: some Scene {
        WindowGroup {
            ZStack {
                StarterPage()
                
                ZStack {
                    if showLaunchView {
                        LaunchScreenView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
                .onAppear {
                    print("token -> \(UserDefaults.standard.string(forKey: "token") ?? "No token")")
                }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
