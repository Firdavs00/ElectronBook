//
//  UserDefaults.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/03/22.
//

import Foundation

struct UserDefault {
    
    func cacheToken(result: AuthResponse) {
        UserDefaults.standard.set(result.token, forKey: "token")
    }
}
