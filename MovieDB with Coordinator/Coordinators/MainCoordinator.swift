//
//  MainCoordinator.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        
        let vc = MainPageViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func seeMovieDetail(of movie: Movie) {
        let child = MovieDetailCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
//        let vc = BuyViewController.instantiate()
//        vc.coordinator = self
//        vc.selectedProduct = productType
//        navigationController.pushViewController(vc, animated: false)
        
    }

//    func createAccount() {
//        let vc = CreateAccountViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: false)
//    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let movieDetailViewController = fromViewController as? MainPageViewController {
            // We're popping a buy view controller; end its coordinator
//            childDidFinish(buyViewController.coordinator)
        }
    }
}

