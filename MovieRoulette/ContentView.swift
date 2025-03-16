//
//  ContentView.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var sessionManager = SessionManager.shared
    
    var body: some View {
        Group {
            if sessionManager.userSession != nil {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
