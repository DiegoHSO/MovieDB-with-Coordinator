//
//  MainCoordinator.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainPageViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func seeMovieDetail(of movie: Movie) {
        let vc = MovieDetailViewController.instantiate()
        vc.coordinator = self
        vc.movie = movie
        navigationController.pushViewController(vc, animated: true)
    }
    
}
