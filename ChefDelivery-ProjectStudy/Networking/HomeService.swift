//
//  HomeService.swift
//  ChefDelivery-ProjectStudy
//
//  Created by Gustavo Ferreira dos Santos on 01/04/25.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-1ebe6-chefdelivery27.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)

        return .success(storesObjects)
    }

    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "https://private-1ebe6-chefdelivery27.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }

        let encodedObject = try JSONEncoder().encode(product)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject

        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]

        return .success(message)
    }
}
