//
//  ProductListingVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 28/06/23.
//

import UIKit
import SkeletonView

class ProductListingVC: UIViewController {
    // MARK: - Variables
    private lazy var viewModel = ProductListingViewModel()
    private let vcTitle = "Product Listing"
    
    // MARK: - IB Outlets
    @IBOutlet private weak var tvProductListing: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - UI Table View Datasource Methods
extension ProductListingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productListing.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tvProductListing.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.productTVCell,
            for: indexPath) else {
            return UITableViewCell()
        }
        productCell.config(with: viewModel.productListing.value[indexPath.row])
        return productCell
    }
}

// MARK: - UI Table View Delegate Methods
extension ProductListingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Functions
extension ProductListingVC {
    private func initialSetup() {
        title = vcTitle
        tvProductListing.dataSource = self
        tvProductListing.delegate = self
        tvProductListing.register(R.nib.productTVCell)
        activityIndicator.startAnimating()
        viewModel.productListing.bind { [weak self] productListing in
            guard let self else {
                return
            }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.tvProductListing.reloadData()
            }
        }
    }
}
