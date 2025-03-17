//
//  MovieRepositoryImpl.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    
    private let movieDataSource: MovieDataSource
//    private let favDataSource: FavDataSource
    
    init(movieDataSource: MovieDataSource) {
        self.movieDataSource = movieDataSource
    }
    
    func getMovies(from page: Int, by query: String) async -> Result<[Movie], AppError> {
        do {
            let moviesData = try await movieDataSource.getMovies(from: page, by: query)
            return .success(moviesData.results?.map{$0.toDomain()} ?? [])
        } catch {
            return .failure(error.toAppError())
        }
    }
    
//    func saveMovieAsFavorite(_ movie: Movie) -> Result<Bool, AppError> {
//        let fav = movie.toData()
//        do{
//            try favDataSource.addFavorite(fav)
//            return .success(true)
//        }catch{
//            return .failure(error.toAppError())
//        }
//    }
//    
//    func deleteMovieAsFavorite(_ movie: Movie) -> Result<Bool, AppError> {
//        let fav = movie.toData()
//        
//        do{
//            try favDataSource.removeFavorite(fav)
//            return .success(true)
//        }catch{
//            return .failure(error.toAppError())
//        }
//    }
//    
//    func fetchFavoriteMovies() -> Result<[Movie], AppError> {
//        do{
//           let favorites = try favDataSource.fetchFavorites()
//            return .success(favorites.map{$0.toDomain()})
//        }catch{
//            return .failure(error.toAppError())
//        }
//    }
}
