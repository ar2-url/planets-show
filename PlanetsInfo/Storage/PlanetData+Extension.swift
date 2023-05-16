//
//  PlanetData+Extension.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 16/05/23.
//

import Foundation
import CoreData

extension PlanetDataEntity {
    static func savePlanetData(planetData: PlanetData, moc: NSManagedObjectContext) throws {
        try deletePlanetsRecords(moc: moc)
        let planetDataEntity = PlanetDataEntity(context: moc)
        
        planetDataEntity.count = Int16(planetData.count)
        planetDataEntity.next = planetData.next
        planetDataEntity.previous = planetData.previous

        planetData.results.forEach {
            let planetEntity =  PlanetEntity.creaetPlanetEntity(planet: $0, moc: moc)
            planetDataEntity.addToPlanets(planetEntity)
        }
        
       try moc.save()
    }
    
    static func fetchPlanetsData(moc: NSManagedObjectContext)-> PlanetDataEntity? {
        let fr = PlanetDataEntity.fetchRequest()
        return (try? moc.fetch(fr))?.first
    }
    
    static func deletePlanetsRecords(moc: NSManagedObjectContext) throws {
        guard let planetDataEntity =  PlanetDataEntity.fetchPlanetsData(moc: moc) else { return }
        moc.delete(planetDataEntity)
        try moc.save()
    }
}
