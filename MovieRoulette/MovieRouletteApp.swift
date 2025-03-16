//
//  MovieRouletteApp.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import SwiftUI

@main
struct MovieRouletteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
