//
//  Movie.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

struct Movie: Identifiable, Equatable {
    let id: Int?
    let title: String?
    let description: String?
    let posterPath: String?
    let backdropPath: String?
    var isFavorite: Bool
    
    init(id: Int?, title: String?, description: String?, posterPath: String?, backdropPath: String?, isFavorite: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.isFavorite = isFavorite
    }
}
