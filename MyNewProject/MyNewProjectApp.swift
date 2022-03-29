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

    @State private var showLaunchView: Bool = true
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
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
//            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

//  sardorbek@gmail.com
