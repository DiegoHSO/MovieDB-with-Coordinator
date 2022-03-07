//
//  Coordinator.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
