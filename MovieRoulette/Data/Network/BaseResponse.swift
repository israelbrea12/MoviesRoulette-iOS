//
//  BaseResponse.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

struct BaseResponse<T>: Codable  where T: Codable{
    let page, total_pages, total_results: Int?
    let results: [T]?
}
