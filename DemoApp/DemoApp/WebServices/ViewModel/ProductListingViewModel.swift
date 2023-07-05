//
//  ProductListingViewModel.swift
//  DemoApp
//
//  Created by Ankit Verma on 29/06/23.
//

import Foundation

class ProductListingViewModel {
    private (set) var productListing = Dynamic([Product]())
    
    init() {
        loadProductsFromAPI()
    }
    
    private func loadProductsFromAPI() {
        APIManager.shared.call(type: .getProductList(noOfProducts: 50, skip: 0), params: nil) {
            [weak self] (result: Swift.Result<ProductList, CustomError>) in
            switch result {
            case .failure(let error):
                print(error.body)
            case .success(let productList):
                print(productList.products.first ?? "")
                self?.productListing.value = productList.products
            }
        }
    }
}
