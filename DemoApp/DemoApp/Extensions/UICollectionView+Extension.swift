//
//  UICollectionView+Extension.swift
//  DemoApp
//
//  Created by Ankit Verma on 02/05/23.
//

import UIKit

extension UICollectionView {
    func scrollToNearestVisibleCollectionViewCell() {
        decelerationRate = UIScrollView.DecelerationRate.fast
        let visibleCenterPositionOfScrollView = Float(contentOffset.x + (bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<visibleCells.count {
            let cell = visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = indexPath(for: cell)?.row ?? 0
            }
        }
        if closestCellIndex != -1 {
            scrollToItem(
                at: IndexPath(row: closestCellIndex, section: 0),
                at: .centeredHorizontally, animated: true)
        }
    }
}
