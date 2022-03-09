//
//  MovieDBAPI.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 09/03/22.
//

import UIKit

//
// MARK: - MovieDB API
//
struct MovieDBAPI {
    
    //
    // MARK: - Instance Methods
    //
    func requestGenres(completionHandler: @escaping (([[String: Any]]) -> Void)) {
        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US")!
        
        typealias WebGenres = [String: Any]
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                  let genresDictionary = json["genres"] as? [WebGenres]
            else {
                completionHandler([])
                return
            }
            completionHandler(genresDictionary)
        }
        .resume()
    }
    
    func requestTotalPages(url: String, completionHandler: @escaping ((Int) -> Void)) {
        let url = URL(string: url)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                  let totalPages = json["total_pages"] as? Int
            else {
                completionHandler(0)
                return
            }
            completionHandler(totalPages)
        }
        .resume()
    }
    
    func requestMoviePoster(url: String, completionHandler: @escaping ((UIImage?) -> Void)) {
        let url = URL(string: "https://image.tmdb.org/t/p/original" + url)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
            else {
                completionHandler(nil)
                return
            }
            let poster = UIImage(data: data)
            completionHandler(poster)
        }
        .resume()
    }
    
    func requestPopularMovies(page: Int, completionHandler: @escaping ([[String: Any]]) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US&page=" + String(page))!
        
        typealias WebMovie = [String: Any]
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                  let moviesDictionary = json["results"] as? [WebMovie]
            else {
                completionHandler([])
                return
            }
            completionHandler(moviesDictionary)
        }
        .resume()
    }
    
    func requestNowPlayingMovies(page: Int, completionHandler: @escaping ([[String: Any]]) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US&page=" + String(page))!
        
        typealias WebMovie = [String: Any]
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                  let moviesDictionary = json["results"] as? [WebMovie]
            else {
                completionHandler([])
                return
            }
            completionHandler(moviesDictionary)
        }
        .resume()
    }
    
}

