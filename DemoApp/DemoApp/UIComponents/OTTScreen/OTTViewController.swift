//
//  OTTViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit

class OTTViewController: UIViewController {
    // MARK: - Variables
    private var movieCatalogs: [MovieCatalog] = [
        MovieCatalog(title: "Newly Added", movies: moviesData),
        MovieCatalog(title: "Upcoming Movies", movies: moviesData),
        MovieCatalog(title: "Users Favourite", movies: moviesData),
    ]

    // MARK: - IB Outlets
    @IBOutlet private weak var tvMovieCatalog: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension OTTViewController {
    private func initialSetup() {
        tvMovieCatalog.dataSource = self
        tvMovieCatalog.delegate = self
        tvMovieCatalog.register(MovieCatalogTVC.nib(),
                                forCellReuseIdentifier: MovieCatalogTVC.identifier)
    }
}

// MARK: - UITableView DataSource Methods
extension OTTViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieCatalogTVC.identifier) as? MovieCatalogTVC else {
            return UITableViewCell()
        }
        cell.configure(with: movieCatalogs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableView Delegate Methods
extension OTTViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
