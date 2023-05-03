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
    private var pullToRefreshControl: UIRefreshControl?
    
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
        tvMovieCatalog.register(MovieCatalogTVCell.nib(),
                                forCellReuseIdentifier: MovieCatalogTVCell.identifier)
        let cell = MovieHeaderView(frame: CGRect(x: 0, y: 0,
                                                 width: tvMovieCatalog.frame.size.width,
                                                 height: 250))
        tvMovieCatalog.tableHeaderView = cell
        pullToRefreshControl = UIRefreshControl()
        if let pullToRefreshControl {
            pullToRefreshControl.tintColor = .white
            pullToRefreshControl.addTarget(self,
                                           action: #selector(loadMovieData),
                                           for: .valueChanged)
            tvMovieCatalog.addSubview(pullToRefreshControl)
        }
    }
    
    @objc func loadMovieData() {
        print("data loading ...")
        DispatchQueue.main.asyncAfter(
            deadline: .now() + .seconds(4), execute: { [weak self] in
                self?.pullToRefreshControl?.endRefreshing()
                self?.addMovies()
                print("done")
            })
    }
    
    private func addMovies() {
        var newCatalogs: [MovieCatalog] = []
        movieCatalogs.forEach { catalog in
            newCatalogs.append(
                MovieCatalog(title: catalog.title,
                             movies: (catalog.movies ?? []) + (catalog.movies ?? [])))
        }
        movieCatalogs = newCatalogs
        tvMovieCatalog.reloadData()
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
            withIdentifier: MovieCatalogTVCell.identifier) as? MovieCatalogTVCell else {
            return UITableViewCell()
        }
        cell.configure(with: movieCatalogs[indexPath.row])
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
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
