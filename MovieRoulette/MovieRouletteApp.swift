//
//  MovieRouletteApp.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import SwiftUI
import FirebaseCore

@main
struct MovieRouletteApp: App {
    
    init(){
        Resolver.shared.injectDependencies()
    }
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var authViewModel = Resolver.shared.resolve(AuthViewModel.self)
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(authViewModel)
        }
    }
}
