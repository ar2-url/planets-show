//
//  Networking.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation
protocol Networking {
    func data(from url: URL,delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}
extension Networking {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await data(from: url, delegate: nil)
    }
}
extension URLSession: Networking {}
