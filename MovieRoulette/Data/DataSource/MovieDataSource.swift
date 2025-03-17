//
//  MovieDataSource.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

typealias MovieResponse = BaseResponse<MovieModel>

protocol MovieDataSource {
    func getMovies(from page: Int, by query: String) async throws -> BaseResponse<MovieModel>
}

class MovieDataSourceImpl: MovieDataSource {
    let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getMovies(from page: Int, by query: String) async throws -> BaseResponse<MovieModel> {
        let request = MovieRequest(page: page, query: query)
        print(request)
        let response: MovieResponse = try await apiManager.makeRequest(request: request)
        return response.self
    }
}

