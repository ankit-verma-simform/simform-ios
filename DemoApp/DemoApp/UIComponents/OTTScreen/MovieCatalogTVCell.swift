//
//  MovieCatalogTVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import UIKit

class MovieCatalogTVCell: UITableViewCell {
    // MARK: - Variables
    static let identifier = "MovieCatalogTVCell"
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
extension MovieCatalogTVCell {
    private func initialSetup() {
        collectionMovieCatalog.dataSource = self
        collectionMovieCatalog.delegate = self
        collectionMovieCatalog.register(MovieCVCell.nib(),
                                        forCellWithReuseIdentifier: MovieCVCell.identifier)
    }
    
    func configure(with movieCatalog: MovieCatalog) {
        self.lblMoveCatalogTitle.text = movieCatalog.title ?? ""
        self.movies = movieCatalog.movies ?? []
        collectionMovieCatalog.reloadData()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCatalogTVCell", bundle: nil)
    }
}

// MARK: - UICollectionView DataSource Methods
extension MovieCatalogTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCVCell.identifier,
                for: indexPath) as? MovieCVCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: movies[indexPath.row])
            return cell
        }
}

// MARK: - UICollectionView Delegate Methods
extension MovieCatalogTVCell: UICollectionViewDelegate {
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

extension MovieCatalogTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
