//
//  MovieRepository.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

protocol MovieRepository {
    func getMovies(from page: Int, by query: String) async -> Result<[Movie], AppError>
//    func saveMovieAsFavorite(_ data: Character)  -> Result<Bool,AppError>
//    func deleteMovieAsFavorite(_ data: Character) -> Result<Bool,AppError>
//    func fetchFavoriteMovies() -> Result<[Character], AppError>
}
