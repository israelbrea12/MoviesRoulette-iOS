//
//  DataParser.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

protocol DataParser {
    func parse<T: Decodable>(data: Data) throws -> T
}
