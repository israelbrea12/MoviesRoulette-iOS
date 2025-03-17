//
//  DataConstant.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

public enum DataConstant {
    public static let baseUrl: String = "api.themoviedb.org"
    public static let port: Int = 443
    public static let upcomingUrl: String = "/3/movie/upcoming"
    public static let popularUrl: String = "/3/movie/popular"
    public static let comicsUrl: String = "/3/movie/popular"
    public static let imagesUrl = "https://image.tmdb.org/t/p/w500"
    public static let scheme: String = "https"
    public static let limit = 17
    
    public static let apiKey: String = "api_key"
    public static let apiKeyValue: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Nzc1NmRhZjkwODMwYTdhMDNkNjA1N2JjYzJmNDBmNiIsIm5iZiI6MTczNDYwNDU5MS41MjksInN1YiI6IjY3NjNmNzJmMWY0YTk1NzJjNGZmZmUxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GoXNV7khGYathGErrG11xGrBjz8SyYhid7ioYnCaQPc"
    public static let ts: String = "ts"
    public static let hash: String = "hash"
    public static let contentType: String = "Content-Type"
    public static let applicationJson: String = "application/json"

}
