//
//  ProductList.swift
//  DemoApp
//
//  Created by Ankit Verma on 27/06/23.
//

// MARK: - ProductList
struct ProductList: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

// MARK: - Category
enum Category: String, Codable {
    case laptops = "laptops"
    case smartphones = "smartphones"
}
