//
//  LoginModel.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/03/22.
//

import Foundation

struct AuthResponse: Decodable {
    let message, token: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let first_name, last_name, email: String?
    let created_at, updated_at: String?
}

