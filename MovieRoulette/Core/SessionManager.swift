//
//  SessionManager.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation
import FirebaseAuth

extension Notification.Name {
    static let userSessionDidChange = Notification.Name("userSessionDidChange")
}

class SessionManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User? {
        didSet {
            NotificationCenter.default.post(name: .userSessionDidChange, object: nil)
        }
    }

    static let shared = SessionManager()
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
}
