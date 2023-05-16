//
//  PlanetsRepository.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation

protocol PlanetsServiceContract {
    func getPlanets(_ url: String, completion: @escaping (Result<PlanetData, NetworkAPIError>)-> Void)
}

final class PlanetsService {
    private var restApiClient: RestApiActions
    private let persistenceClient: PersistenceContract
    
    init(restApiClient: RestApiActions = RestApiClient(), persistenceClient: PersistenceContract = PersistenceClient()) {
        self.restApiClient = restApiClient
        self.persistenceClient = persistenceClient
    }
}

extension PlanetsService:PlanetsServiceContract {
    func getPlanets(_ url: String, completion: @escaping (Result<PlanetData, NetworkAPIError>) -> Void) {
        
         restApiClient.get(url: url, model: PlanetData.self) {[weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(.success(response))
                }
                // if api call is success saving data to local storage
                self?.persistenceClient.savePlanetsData(response)
            case .failure(_) :
                // if api calls fails reading local data ,
                let planetData = self?.persistenceClient.fetchPlanetsData()
                guard  let _planetData = planetData else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkAPIError.dataNotFound))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(_planetData))
                }
            }
        }
        
        // Fetching local stoard data
        let planetData = persistenceClient.fetchPlanetsData()
        if let _planetData = planetData {completion(.success(_planetData))}
    }
}
