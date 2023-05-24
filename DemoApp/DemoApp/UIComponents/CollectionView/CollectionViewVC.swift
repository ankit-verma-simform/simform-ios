//
//  CollectionViewVCViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 28/04/23.
//

import UIKit

class CollectionViewVC: UIViewController {
    // MARK: - Variables
    private let movies = Movie.getMovies()

    // MARK: - IB Outlets
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

// MARK: - Datasource Methods
extension CollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCollectionViewCell",
            for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(movie: movies[indexPath.row])
        return cell
    }
}

// MARK: - UI Collection View Delegate Methods
extension CollectionViewVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Movie selected: \(indexPath)")
    }
}

// MARK: - UI Collection View Delegate FlowLayout Methods
extension CollectionViewVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(view.frame.width / 2, 300)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
