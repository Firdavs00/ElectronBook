//
//  LoginViewModel.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/03/22.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @AppStorage("teacherSignIn") var teachSign: Bool = false
    
    var userDefault = UserDefault()
    @Published var user: User?
    @Published var isErrorCode401: Bool = false
    var isLoading: Bool = false
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
//                    self.isLoading = true
                    DispatchQueue.main.async { [weak self] in
                       
                        if result.token != nil {
                            self?.userDefault.cacheToken(result: result)
                            self?.teachSign = true
//                            self?.isLoading = false
                            print(result)
                        }
                    }
                }else {
                    self.teachSign = true
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
