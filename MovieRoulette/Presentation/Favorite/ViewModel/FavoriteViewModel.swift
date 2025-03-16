//
//  FavoriteViewModel.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation

@MainActor
final class FavoriteViewModel: ObservableObject {
    @Published var state: ViewState = .success
}
