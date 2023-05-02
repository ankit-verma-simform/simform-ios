//
//  MovieCatalogTVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit

class MovieCatalogTVC: UITableViewCell {
    // MARK: - Variables
    static let identifier = "MovieCatalogTVC"
    private var movies: Movies = []
    
    // MARK: - IB Outlets
    @IBOutlet private weak var lblMoveCatalogTitle: UILabel!
    @IBOutlet private weak var collectionMovieCatalog: UICollectionView!
    
    // MARK: - View Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
}

// MARK: - Functions
extension MovieCatalogTVC {
    private func initialSetup() {
        collectionMovieCatalog.dataSource = self
        collectionMovieCatalog.delegate = self
        collectionMovieCatalog.register(MovieCVC.nib(),
                                        forCellWithReuseIdentifier: MovieCVC.identifier)
    }
    
    func configure(with movieCatalog: MovieCatalog) {
        self.lblMoveCatalogTitle.text = movieCatalog.title ?? ""
        self.movies = movieCatalog.movies ?? []
        collectionMovieCatalog.reloadData()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCatalogTVC", bundle: nil)
    }
}

// MARK: - UICollectionView DataSource Methods
extension MovieCatalogTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCVC.identifier,
                for: indexPath) as? MovieCVC else {
                return UICollectionViewCell()
            }
            cell.configure(with: movies[indexPath.row])
            return cell
        }
}

// MARK: - UICollectionView Delegate Methods
extension MovieCatalogTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Tapped on movie \(indexPath)")
        print(movies[indexPath.row])
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 3,
                      height: collectionView.frame.size.height)
    }
}

extension MovieCatalogTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
