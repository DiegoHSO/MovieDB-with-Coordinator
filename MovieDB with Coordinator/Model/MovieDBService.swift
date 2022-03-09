//
//  MovieDBService.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

//
// MARK: - MovieDB Service
//
struct MovieDBService {
    
    //
    // MARK: - Variables And Properties
    //
    let movieDBParser = MovieDBParser()
    let movieDBAPI = MovieDBAPI()
    
    //
    // MARK: - Instance Methods
    //
    func getPopularMovies(page: Int, completionHandler: @escaping ([Movie]) -> Void) {
        movieDBAPI.requestPopularMovies(page: page) { (moviesDictionary) in
            let movies = moviesDictionary.compactMap{ movieDBParser.parseMovieDictionary(dictionary: $0) }
            completionHandler(movies)
        }
    }
    
    func getNowPlayingMovies(page: Int, completionHandler: @escaping ([Movie]) -> Void) {
        movieDBAPI.requestNowPlayingMovies(page: page) { (moviesDictionary) in
            let movies = moviesDictionary.compactMap{ movieDBParser.parseMovieDictionary(dictionary: $0) }
            completionHandler(movies)
        }
    }
    
    func getMoviePoster(url: String, completionHandler: @escaping ((UIImage?) -> Void)) {
        movieDBAPI.requestMoviePoster(url: url) { (poster) in
            completionHandler(poster)
        }
    }
    
    func getGenres(genreIDs: [Int], completionHandler: @escaping (([String]) -> Void)) {
        movieDBAPI.requestGenres { (genreDictionary) in
            let allGenres = genreDictionary.compactMap{ movieDBParser.parseGenreDictionary(dictionary: $0) }
            
            var movieGenres: [String] = []
            for genre in allGenres {
                for genreID in genreIDs {
                    if genre.id == genreID {
                        movieGenres.append(genre.name)
                    }
                }
            }
            completionHandler(movieGenres)
        }
    }
    
    func getTotalPages(url: String, completionHandler: @escaping ((Int) -> Void)) {
        movieDBAPI.requestTotalPages(url: url) { (value) in
            completionHandler(value)
        }
    }
    
}
