//
//  MockingPlanetRepository.swift
//  PlanetsInfoTests
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation
@testable import PlanetsInfo

class MockingPlanetService: PlanetsServiceContract {
   
    private var planetData: PlanetData?
    private var error: NetworkAPIError?

    func getPlanets(_ url: String, completion: @escaping (Result<PlanetsInfo.PlanetData, PlanetsInfo.NetworkAPIError>) -> Void) {
        if error != nil {
            completion(.failure(NetworkAPIError.dataNotFound))
            return
        }
        completion(.success(planetData!))
    }

    func setDummyResponse(planetsData: PlanetData) {
        self.planetData = planetsData
    }
    func setDummyError(error: NetworkAPIError) {
        self.error = error
    }
}
