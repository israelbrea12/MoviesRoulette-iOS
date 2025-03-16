//
//  ViewState.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation

enum ViewState: Equatable {
    case initial, loading, error(String), success, empty
}
