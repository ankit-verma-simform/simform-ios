//
//  SearchBarVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/05/23.
//

import UIKit

class SearchBarVC: UIViewController {
    // MARK: - Variables
    private var movieListing = Movie.getMovies()
    private var searchMovieListing: [Movie] = []
    private var searchIsActive: Bool {
        searchBar.searchTextField.hasText
    }
    
    // MARK: - IB Outlets
    @IBOutlet private weak var tvMovieListing: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
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
        searchBar.delegate = self
        navigationItem.title = "Movies"
    }
}

// MARK: - UITableView DataSource Methods
extension SearchBarVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchIsActive ? searchMovieListing.count : movieListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tvMovieListing.dequeueReusableCell(
            withIdentifier: MovieListingTVCell.identifier, for: indexPath) as? MovieListingTVCell else {
            return UITableViewCell()
        }
        movieCell.configure(with: searchIsActive ? searchMovieListing[indexPath.row] : movieListing[indexPath.row])
        return movieCell
    }
}

// MARK: - UITableView Delegate Methods
extension SearchBarVC: UITableViewDelegate {
    
}

// MARK: - SearchBar Delegate Methods
extension SearchBarVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMovieListing = movieListing.filter {
            $0.title.lowercased().contains(
                searchText.lowercased()
            )
        }
        tvMovieListing.reloadData()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool { // return NO to not become first responder
        print(#function)
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) { // called when text starts editing
        print(#function)
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool { // return NO to not resign first responder
        print(#function)
        return true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) { // called when text ends editing
        print(#function)
    }
    
    func searchBar(_ searchBar: UISearchBar,
                   shouldChangeTextIn range: NSRange,
                   replacementText text: String) -> Bool { // called before text changes
        print(#function)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { // called when keyboard search button pressed
        print(#function)
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) { // called when bookmark button pressed
        print(#function)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) { // called when cancel button pressed
        print(#function)
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) { // called when search results button pressed
        print(#function)
    }
}
