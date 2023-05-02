//
//  MovieHeaderView.swift
//  DemoApp
//
//  Created by Ankit Verma on 02/05/23.
//

import UIKit

class MovieHeaderView: UIView {
    // MARK: - Variables
    private let topTrendings = movies
    private var currentMovieShowingPage = 0
    
    // MARK: - IB Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var movieHeaderCollection: UICollectionView!
    @IBOutlet private weak var moviePageControl: UIPageControl!
    
    // MARK: - View Lifecycle Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    // MARK: - Initialize Subviews
    private func initSubviews() {
        let nib = UINib(nibName: "MovieHeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        configure()
    }
}

// MARK: - UICollectionView Datasource Methods
extension MovieHeaderView: UICollectionViewDataSource {
    private func configure() {
        movieHeaderCollection.delegate = self
        movieHeaderCollection.dataSource = self
        movieHeaderCollection.register(MovieHeaderCVCell.nib(),
                                       forCellWithReuseIdentifier: MovieHeaderCVCell.identifier)
        moviePageControl.numberOfPages = topTrendings.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return topTrendings.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.size.width,
                          height: collectionView.frame.size.height)
        }
}

// MARK: - UICollectionView Delegate Methods
extension MovieHeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = movieHeaderCollection.dequeueReusableCell(
            withReuseIdentifier: MovieHeaderCVCell.identifier,
            for: indexPath) as? MovieHeaderCVCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: topTrendings[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        movieHeaderCollection.scrollToNearestVisibleCollectionViewCell()
    }
    
    func scrollViewDidEndDragging(
        _ scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            if !decelerate {
                movieHeaderCollection.scrollToNearestVisibleCollectionViewCell()
            }
        }
}

// MARK: - UICollectionView Delegate FlowLayout Methods
extension MovieHeaderView: UICollectionViewDelegateFlowLayout {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        moviePageControl.currentPage = movieHeaderCollection
            .indexPathsForVisibleItems[0].row
    }
}
