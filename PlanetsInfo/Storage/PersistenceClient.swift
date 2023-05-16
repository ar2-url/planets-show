//
//  PersistenceManager.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 16/05/23.
//

import Foundation

protocol  PersistenceContract {
   func savePlanetsData(_ planetData: PlanetData)
   func fetchPlanetsData()-> PlanetData?
}

final class PersistenceClient: PersistenceContract {
    func savePlanetsData(_ planetData: PlanetData) {
        do {
            try PlanetDataEntity.savePlanetData(planetData: planetData, moc: PersistenceController.shared.container.viewContext)
        } catch {
            print("Failed to save planets")
        }
    }
    
    func fetchPlanetsData()-> PlanetData? {
        let planetDataEntity = PlanetDataEntity.fetchPlanetsData(moc: PersistenceController.shared.container.viewContext)
        return planetDataEntity?.mapToPanetData()
    }
}
