//
//  MoviesLoader.swift
//  MovieQuiz
//
//  Created by Olya on 04.09.2026.
//

import Foundation
protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}

struct MoviesLoader: MoviesLoading {
    private let networkClient = NetworkClient()
    private var mostPopularMoviesUrl: URL {
        guard let url = URL(string: "https://tv-api.com/en/API/Top250Movies/k_j4r66gt6") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
        networkClient.fetch(url: mostPopularMoviesUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let mostPopularMovies = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                    if !mostPopularMovies.errorMessage.isEmpty {
                        let error = NSError(domain: "MostPopularMovies", code: 1, userInfo: [NSLocalizedDescriptionKey: mostPopularMovies.errorMessage])
                        handler(.failure(error))
                    } else {
                        handler(.success(mostPopularMovies))
                    }
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
        func loadImage(from url: URL, handler: @escaping (Result<Data, Error>) -> Void){
            networkClient.fetch(url: url, handler: handler)
        }
    }
}
