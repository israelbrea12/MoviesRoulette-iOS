//
//  AppError.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation

import Foundation

enum AppError: Error {
    case networkError(String)  // Para problemas de conexión
    case authenticationError(String)  // Errores de autenticación en Firebase
    case databaseError(String)  // Errores en Firestore o Realtime Database
    case unknownError(String)  // Para errores no identificados
}
