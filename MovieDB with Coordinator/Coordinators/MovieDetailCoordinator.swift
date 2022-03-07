//
//  MovieDetailCoordinator.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

class MovieDetailCoordinator: Coordinator {
//    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MovieDetailViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        // we'll add code here
    }
    
//    func didFinishSeeingMovieDetail() {
//        parentCoordinator?.childDidFinish(self)
//    }
}

