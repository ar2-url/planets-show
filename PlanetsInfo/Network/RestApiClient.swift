//
//  NetworkApiManager.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation
protocol RestApiActions {
    func get<T: Decodable>(url: String, model: T.Type, completion: @escaping (Result<T, NetworkAPIError>)-> Void)
}

class RestApiClient :RestApiActions {
    func get<T>(url: String, model: T.Type, completion: @escaping (Result<T, NetworkAPIError>) -> Void) where T : Decodable {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkAPIError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else {
                completion(.failure(NetworkAPIError.dataNotFound))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(NetworkAPIError.parsingError))
            }
        }.resume()
    }
}
