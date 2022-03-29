//
//  LoginModel.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/03/22.
//

import Foundation

struct AuthResponse: Decodable {
    let message, token: String?        
    var user: User?
    init(message: String?,token: String) {
        self.message = message
        self.token = token
    }
}

// MARK: - User
struct User: Codable {
    var id: Int?
    var first_name, last_name, email: String?
    var created_at, updated_at: String?
    
    init(id: Int?, first_name: String?, last_name: String?) {
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
    }
}
