//
//  MovieRequest.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 17/3/25.
//

import Foundation

struct MovieRequest: RequestProtocol, CustomStringConvertible {
    
    private let page: Int
    private let query: String
    
    var path: String {
        DataConstant.popularUrl
    }
    
    var httpMethodType: HTTPMethodType {
        .GET
    }
    
    var urlParams: [String: String?] {
        var params = [
            "page": "\(page)",
        ]
        if !query.isEmpty {
            params["query"] = query
        }
        return params
    }
    
    init(page: Int, query: String) {
        self.page = page
        self.query = query
    }
}
