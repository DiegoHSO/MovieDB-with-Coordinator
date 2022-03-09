//
//  Movie.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 09/03/22.
//

import UIKit

//
// MARK: - Movie
//
struct Movie: CustomStringConvertible, Equatable {
    
    //
    // MARK: - Variables And Properties
    //
    let id: Int
    let title: String
    let description: String
    let rating: Double
    let posterURL: String
    var poster: UIImage?
    var genreIDs: [Int]
    var genres: [String]?
    
    //
    // MARK: - Instance Methods
    //
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.description == rhs.description
    }
    
}
