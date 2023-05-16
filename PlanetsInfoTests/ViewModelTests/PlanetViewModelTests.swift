//
//  PlanetViewModelTests.swift
//  PlanetsInfoTests
//
//  Created by Artur Knul on 19/04/2023.
//

import XCTest
@testable import PlanetsInfo

final class PlanetViewModelTests: XCTestCase {

    var mockingPlanetService: MockingPlanetService!
    var planetViewModel: PlanetsViewModel!

    override func setUp() {
        mockingPlanetService = MockingPlanetService()
        planetViewModel =  PlanetsViewModel(planetsService:mockingPlanetService )
    }

    override func tearDown() {
        mockingPlanetService = nil
        planetViewModel =  nil
    }
    
    func test_getPlanetSuccess() {
        mockingPlanetService.setDummyResponse(planetsData: PlanetData(count: 1, next: "1", previous: nil, results:[Planet(name: "Planet1", rotationPeriod: "", orbitalPeriod: "", diameter: "", climate: "", gravity: "", terrain: "", surfaceWater: "", population: "", residents: [], films: [], created: "", edited: "", url: "")]))
        
        planetViewModel.getPlanets("test")
        
        XCTAssertEqual(planetViewModel.planets.count, 1)
        XCTAssertEqual(planetViewModel.planets.first?.name, "Planet1")

    }
    
    func test_getPlanetFailure() {
        mockingPlanetService.setDummyError(error: NetworkAPIError.dataNotFound)
        
        planetViewModel.getPlanets("test")
        
        XCTAssertEqual(planetViewModel.planets.count, 0)
        XCTAssertEqual(planetViewModel.error, NetworkAPIError.dataNotFound)
    }
}
