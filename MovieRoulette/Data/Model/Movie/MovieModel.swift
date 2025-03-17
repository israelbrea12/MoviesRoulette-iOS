//
//  MovieModel.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

struct MovieModel: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let poster_path: String?
    let backdrop_path: String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case overview
        case poster_path
        case backdrop_path
    }
    
    init(id: Int?, title: String?, overview: String?, poster_path: String?, backdrop_path: String?) {
        self.id = id
        self.title = title
        self.overview = overview
        self.poster_path = backdrop_path
        self.backdrop_path = poster_path
    }
}
