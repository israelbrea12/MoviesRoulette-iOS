//
//  MovieMapper.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

extension MovieModel {
    func toDomain() -> Movie {
        return Movie(id: self.id,
                     title: self.title,
                     description: self.overview,
                     posterPath: self.poster_path,
                     backdropPath: self.backdrop_path,
                     isFavorite: false)
    }
}

//extension Movie {
//    func toData() -> Favorite {
//        return Favorite {
//            return Favorite()
//        }
//    }
//}

//extension Favorite
