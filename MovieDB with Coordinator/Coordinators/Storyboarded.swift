//
//  Storyboarded.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

//
// MARK: - Storyboarded
//

protocol Storyboarded {
    static func instantiate(_ storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(_ storyboard: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
}
