//
//  Resolver.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation
import Swinject

public final class Resolver {
    static let shared = Resolver()
    
    private var container = Container()
    
    private init() {
    }
    
    @MainActor func injectDependencies() {
        injectNetwork()
        injectDataSource()
        injectRepository()
        injectUseCase()
        injectViewModel()
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

// MARK: - Network

extension Resolver {
    @MainActor func injectNetwork() {
        container.register(NetworkManager.self) { _ in
            NetworkManagerImpl()
        }.inObjectScope(.container)
        
        container.register(DataParser.self){_ in
            JsonDataParser()
        }.inObjectScope(.container)
        
        container.register(APIManager.self){ resolver in
            APIManagerImpl(networkManager: resolver.resolve(NetworkManager.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - DataSource
extension Resolver {
    @MainActor func injectDataSource() {
        
        // Auth
        container.register(AuthDataSource.self) { _ in
            AuthDataSourceImpl()
        }.inObjectScope(.container)
        
        //--------------------------------------------------------------------------------
        // Movie
        container.register(MovieDataSource.self){ resolver in
            MovieDataSourceImpl(apiManager: resolver.resolve(APIManager.self)!)
        }.inObjectScope(.container)
    }
}

// MARK: - Repository

extension Resolver {
    @MainActor func injectRepository() {
        
        // Auth
        container.register(AuthRepository.self){resolver in
            AuthRepositoryImpl(dataSource: resolver.resolve(AuthDataSource.self)!)
        }.inObjectScope(.container)
        
        //--------------------------------------------------------------------------------
        // Movie
        container.register(MovieRepository.self){resolver in
            MovieRepositoryImpl(movieDataSource: resolver.resolve(MovieDataSource.self)!)
        }.inObjectScope(.container)
    }
}


// MARK: - UseCase

extension Resolver {
    @MainActor func injectUseCase() {
        
        // Auth
        container.register(SignInUseCase.self) { resolver in
            SignInUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(SignUpUseCase.self) { resolver in
            SignUpUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(SignOutUseCase.self) { resolver in
            SignOutUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        container.register(FetchUserUseCase.self) { resolver in
            FetchUserUseCase(repository: resolver.resolve(AuthRepository.self)!)
        }.inObjectScope(.container)
        
        //--------------------------------------------------------------------------------
        // Movie
        container.register(GetMovieUseCase.self){resolver in
            GetMovieUseCase(movieRepository: resolver.resolve(MovieRepository.self)!)
        }.inObjectScope(.container)
    }

}


// MARK: - ViewModel

extension Resolver {
    @MainActor func injectViewModel() {
        
        // Auth
        container.register(SettingsViewModel.self) { resolver in
            SettingsViewModel(
                signOutUseCase: resolver.resolve(SignOutUseCase.self)!, fetchUserUseCase: resolver.resolve(FetchUserUseCase.self)!
                )
            }.inObjectScope(.container)
        
        container.register(AuthViewModel.self) { resolver in
                AuthViewModel(
                    signInUseCase: resolver.resolve(SignInUseCase.self)!,
                    signUpUseCase: resolver.resolve(SignUpUseCase.self)!
                )
            }.inObjectScope(.container)
        
        //--------------------------------------------------------------------------------
        // Movie
        container.register(HomeViewModel.self){resolver in
            HomeViewModel(getMoviesUseCase: resolver.resolve(GetMovieUseCase.self)!)
        }.inObjectScope(.container)
    }
}
