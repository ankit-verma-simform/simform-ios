//
//  SearchBarVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/05/23.
//

import UIKit

class SearchBarVC: UIViewController {
    // MARK: - Variables
    private var movieListing = movies
    
    // MARK: - IB Outlets
    @IBOutlet private weak var tvMovieListing: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension SearchBarVC {
    private func initialSetup() {
        tvMovieListing.dataSource = self
        tvMovieListing.delegate = self
        tvMovieListing.register(MovieListingTVCell.nib(),
                                forCellReuseIdentifier: MovieListingTVCell.identifier)
    }
}

// MARK: - UITableView DataSource Methods
extension SearchBarVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tvMovieListing.dequeueReusableCell(
            withIdentifier: MovieListingTVCell.identifier, for: indexPath) as? MovieListingTVCell else {
            return UITableViewCell()
        }
        return movieCell
    }
}

// MARK: - UITableView Delegate Methods
extension SearchBarVC: UITableViewDelegate {
    
}
