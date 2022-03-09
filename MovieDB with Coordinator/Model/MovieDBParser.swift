//
//  MovieDBParser.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 09/03/22.
//

import UIKit

//
// MARK: MovieDB Parser
//
struct MovieDBParser {
    
    //
    // MARK: - Instance Methods
    //
    func parseMovieDictionary(dictionary: [String: Any]) -> Movie? {
        guard let id = dictionary["id"] as? Int,
              let title = dictionary["title"] as? String,
              let description = dictionary["overview"] as? String,
              let rating = dictionary["vote_average"] as? Double,
              let posterURL = dictionary["poster_path"] as? String,
              let genreIDs = dictionary["genre_ids"] as? [Int]
        else { return nil }
        
        return Movie(id: id, title: title, description: description, rating: rating, posterURL: posterURL, genreIDs: genreIDs)
    }
    
    func parseGenreDictionary(dictionary: [String: Any]) -> Genre? {
        guard let id = dictionary["id"] as? Int,
              let name = dictionary["name"] as? String
        else { return nil }
        
        return Genre(id: id, name: name)
    }
    
}

