//
//  GetMovieUseCase.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

class GetMovieUseCase: UseCaseProtocol {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(with params: GetMoviesParam) async -> Result<[Movie], AppError> {
        await movieRepository.getMovies(from: params.page, by: params.query)
    }
}
