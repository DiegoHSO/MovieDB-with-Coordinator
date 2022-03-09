//
//  MainCoordinator.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    //
    // MARK: - Variables And Properties
    //
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    //
    // MARK: - Initialization
    //
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //
    // MARK: - Class Methods
    //
    func start() {
        let vc = MainPageViewController.instantiate("MainPage")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func seeMovieDetail(of movie: Movie) {
        let vc = MovieDetailViewController.instantiate("MovieDetail")
        vc.coordinator = self
        vc.movie = movie
        navigationController.pushViewController(vc, animated: true)
    }
    
}
