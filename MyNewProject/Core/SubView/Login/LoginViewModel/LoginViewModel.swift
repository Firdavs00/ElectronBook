//
//  LoginViewModel.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/03/22.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    var userDefault = UserDefault()
    @Published var user: User?
    @Published var isErrorCode401: Bool = false
    @Published var email = ""
    @Published var password = ""
    
    func postLogin(email: String, password: String) {
        
        guard let url = URL(string: "http://myadmin.fais.uz/api/login?email=\(email)&password=\(password)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type" : "application/json"]
        
        URLSession.shared.dataTask(with: request) { model, response, error in
            
            if let data = model, let response = response as? HTTPURLResponse,
               (response.statusCode >= 200 && response.statusCode < 300) {
                
                if let result = try? JSONDecoder().decode(AuthResponse.self, from: data) {
                    DispatchQueue.main.async { [weak self] in
                        
                        if result.token != nil {
                            self?.userDefault.cacheToken(result: result)
                            guard let users = result.user else { return }
                            
                            self?.user = users
                            print("\(self?.user)")
                            UserDefaults.standard.set(true, forKey: "teacherStatus")
                            NotificationCenter.default.post(name: NSNotification.Name("teacherStatus"), object: nil)
                            print(result)
                        }
                    }
                }else {
                    print("---->\(String(describing: error))")
                }
            }
        }.resume()
    }
}

struct AuthErrorMessage: Decodable, Hashable{
    var status: String?
    var message: String?
}
