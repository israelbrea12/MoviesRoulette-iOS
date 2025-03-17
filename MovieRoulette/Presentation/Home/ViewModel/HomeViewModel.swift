//
//  HomeViewModel.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var searchDebounced = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: ViewState = .success
    
    private var page: Int = 1
    
    let getMoviesUseCase: GetMovieUseCase
    
    
    init(getMoviesUseCase: GetMovieUseCase){
        self.getMoviesUseCase = getMoviesUseCase
        
        $searchQuery.debounce(for: 0.5, scheduler: RunLoop.main).removeDuplicates().assign(to: &$searchDebounced)
        
        Task{
            await self.fetchMovies()
        }
    }
    
    public func searchMovies() async {
        movies = []
        await fetchMovies()
    }
    
    public func fetchMovies() async {
        state = .loading
        let result = await getMoviesUseCase.execute(with: GetMoviesParam(page: page, query: searchDebounced))
        print(result)
        
        
        switch result {
            case .success(let data):
            movies.append(contentsOf: data)
            state = movies.isEmpty ? .empty : .success
            case .failure(let err):
                state = .error(err.localizedDescription)
        }

    }
}
