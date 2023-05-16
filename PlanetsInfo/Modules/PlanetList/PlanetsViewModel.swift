//
//  PlanetsViewModel.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation


class PlanetsViewModel: ObservableObject {
    private var planetData: PlanetData?
    @Published private(set) var planets:[Planet] = []
    @Published private(set) var error: NetworkAPIError?
    private let planetsService: PlanetsServiceContract
    
    init(planetsService: PlanetsServiceContract = PlanetsService()) {
        self.planetsService = planetsService
    }
}

extension PlanetsViewModel {
    func getPlanets(_ url: String) {
        planetsService.getPlanets(url) { [weak self] result in
            switch result {
            case .success(let planetData):
                    self?.planetData = planetData
                    self?.planets = planetData.results
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
