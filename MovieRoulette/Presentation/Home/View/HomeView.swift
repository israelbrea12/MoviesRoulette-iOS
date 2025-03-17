//
//  HomeView.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = Resolver.shared.resolve(HomeViewModel.self)
    
    var body: some View {
        NavigationStack{
            ZStack(
                content:{
                    switch viewModel.state{
                    case .initial,
                         .loading:
                        loadingView()
                    case .success:
                        successView()
                    case .error(let errorMessage):
                        errorView(errorMsg:errorMessage)
                    default:
                        emptyView()
                    }
                }
            )
            .navigationTitle("Home")
            .searchable(text: $viewModel.searchQuery, prompt: "Search movie").onChange(of: viewModel.searchDebounced, perform:{ _ in
                Task{
                    await viewModel.searchMovies()
                }
            })
        }
    }
    
    private func loadingView() -> some View {
        ProgressView()
    }
    
    private func successView() -> some View {
        List{
            ForEach(viewModel.movies){ movie in
                ZStack(
                content:{
                    MovieRow(movie: movie, removeAction: nil)
//                    NavigationLink(destination: MovieDetailView(movie: movie).toolbar(.hidden, for: .tabBar)){
//                        EmptyView() //Label
//                    }
                }) //ZStack
                
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 16))
            }
        } //List
        .listStyle(PlainListStyle())
        .scrollIndicators(.hidden)
    }
    
    private func emptyView() -> some View {
        InfoView(message: "No data found")
    }
    
    private func errorView(errorMsg: String) -> some View {
        InfoView(message: errorMsg)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
