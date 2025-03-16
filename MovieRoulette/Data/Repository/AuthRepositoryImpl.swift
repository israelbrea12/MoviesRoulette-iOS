//
//  AuthRepositoryImpl.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation

class AuthRepositoryImpl: AuthRepository {
    
    private let dataSource: AuthDataSource
    
    init(dataSource: AuthDataSource) {
        self.dataSource = dataSource
    }
    
    func signIn(email: String, password: String) async -> Result<User, AppError> {
        do {
            let userModel = try await dataSource.signIn(email: email, password: password)
            return .success(userModel.toDomain())
        } catch {
            return .failure(error.toAppError())
        }
    }
    
    func signUp(email: String, password: String, fullName: String) async -> Result<User, AppError> {
        do {
            print("DEBUG: Iniciando signUp en AuthRepositoryImpl")
            let userModel = try await dataSource.signUp(email: email, password: password, fullName: fullName)
            print("DEBUG: Usuario registrado correctamente: \(userModel)")
            return .success(userModel.toDomain())
        } catch {
            print("DEBUG: Error en AuthRepositoryImpl: \(error.localizedDescription)")
            return .failure(error.toAppError())
        }
    }

    
    func signOut() -> Result<Bool, AppError> {
        do {
            try dataSource.signOut()
            return .success(true)
        } catch {
            return .failure(error.toAppError())
        }
    }
    
    func fetchUser() async -> Result<User?, AppError> {
        do {
            let userModel = try await dataSource.fetchCurrentUser()
            return .success(userModel.toDomain())
        } catch {
            return .failure(error.toAppError())
        }
    }
}
