import SwiftUI
import CachedAsyncImage

struct MovieRow: View {
    let movie: Movie
    let removeAction: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 12) {
            CachedAsyncImage(
                url: URL(string: "\(DataConstant.imagesUrl)\(movie.posterPath ?? "")"),
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 120)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 120)
                        .clipped()
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)
                        .foregroundColor(.gray)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(movie.title ?? "Sin título")
                        .font(.headline)
                        .lineLimit(1)

                    Spacer()
                    
                    if let removeAction = removeAction {
                        Button(action: removeAction) {
                            Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .font(.system(size: 20))
                        }
                    }
                }

                if let description = movie.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(3)
                } else {
                    Spacer()
                }
            }
            .padding()
        }
        .padding(.horizontal, 8)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(
            movie: Movie(
                id: 696506,
                title: "Mickey 17",
                description: "Una película de ciencia ficción...",
                posterPath: "/edKpE9B5qN3e559OuMCLZdW1iBZ.jpg",
                backdropPath: "/qUc0Hol3eP74dbW4YyqT6oRLYgT.jpg",
                isFavorite: true
            ),
            removeAction: nil
        )
        .previewLayout(.sizeThatFits)
    }
}
