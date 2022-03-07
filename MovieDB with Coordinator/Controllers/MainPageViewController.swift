//
//  MainPageViewController.swift
//  MovieDB with Coordinator
//
//  Created by Diego Henrique on 07/03/22.
//

import UIKit

class MainPageViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var popularMoviesPage: Int = 1
    var nowPlayingMoviesPage: Int = 1
    var popularMoviesTotalPages: Int = 0
    var nowPlayingMoviesTotalPages: Int = 0
    
    let movieDBService = MovieDBService()
    
    var filteredPopularMovies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.isHidden = self.popularMovies.isEmpty
                self.activityIndicator.isHidden = !self.popularMovies.isEmpty
            }
        }
    }
    
    var filteredNowPlayingMovies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.isHidden = self.popularMovies.isEmpty
                self.activityIndicator.isHidden = !self.popularMovies.isEmpty
            }
        }
    }
    
    var popularMovies: [Movie] = []
    
    var nowPlayingMovies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Logic for Popular and Now Playing movies (number of rows)
        if section == 0 {
            return filteredPopularMovies.count+1
        }
        else {
            return filteredNowPlayingMovies.count+1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Logic for Popular and Now Playing movies
        return UITableViewCell()
    }
    
}

extension MainPageViewController: UITableViewDelegate {
    
}

