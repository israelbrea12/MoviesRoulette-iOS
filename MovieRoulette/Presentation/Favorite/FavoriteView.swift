//
//  FavoriteView.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var favoriteViewModel = FavoriteViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack (
                content: {
                    switch favoriteViewModel.state {
                    case .initial,
                            .loading:
                        loadingView()
                    case .error(let errorMessage):
                        errorView(errorMsg: errorMessage)
                    case .success:
                        successView()
                    default:
                        emptyView()
                    }
                }
            )}
    }
    
    private func successView() -> some View {
        Text("success")
    }
    
    private func loadingView() -> some View {
        ProgressView()
    }
    
    private func emptyView() -> some View {
        InfoView(message: "No data found")
    }
    
    private func errorView(errorMsg: String) -> some View {
        InfoView(message: errorMsg)
    }
}

#Preview {
    HomeView()
}

