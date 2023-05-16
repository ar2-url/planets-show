//
//  NetworkAPIError.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation
enum NetworkAPIError: Error {
    case invalidURL
    case parsingError
    case dataNotFound
    case responseError
}

extension NetworkAPIError:LocalizedError {
    var errorDescription :String? {
        switch self{
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "invalidURL")
        case .parsingError:
            return NSLocalizedString("Encountered Parsing Error", comment: "parsingError")
        case .dataNotFound:
            return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
        case .responseError:
            return NSLocalizedString("Invalid Response Code from API", comment: "responseError")

        }
    }
}
