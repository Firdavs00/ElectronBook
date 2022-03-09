//
//  SessionStore.swift
//  MyNewProject
//
//  Created by Firdavs Boltayev on 07/01/22.
//

import Foundation
import Foundation
import Combine
import Firebase

class SessionStore: ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?

    func listen () {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
            } else {
                self.session = nil
            }
        }
    }
    // additional methods (sign in) will go here
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
}
