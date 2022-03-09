//
//  Coordinator.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

protocol Coordinator: AnyObject {
    
    //
    // MARK: - Variables And Properties
    //
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    //
    // MARK: - Methods
    //
    func start()
    
}
