//
//  HomeModel.swift
//  AutoCheckAssessment
//
//  Created by Karim on 10/10/2022.
//

import Foundation

// MARK: - Welcome
struct Brands: Codable {
    let brandsData: [BrandsData]?
    let pagination: Pagination?
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case brandsData = "makeList"
    }
}

// MARK: - MakeList
struct BrandsData: Codable {
    let id: Int?
    let name: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
    
    init(brand: BrandsData) {
        self.id = brand.id
        self.name = brand.name
        self.imageURL = brand.imageURL
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, currentPage, pageSize: Int?
}

struct Cars: Codable {
    let carsData: [CarsData]?
    let pagination: Pagination?
}

struct CarsData: Codable {
    var id: String?
    var name: String?
    var imageURL: String?
    var price: String?
    var review: String?

    enum CodingKeys: String, CodingKey {
        case id, name, price, review
        case imageURL = "imageUrl"
    }
    
    init(car: CarsData) {
        self.id = car.id
        self.name = car.name
        self.imageURL = car.imageURL
        self.price = car.price
        self.review = car.review
    }
}
