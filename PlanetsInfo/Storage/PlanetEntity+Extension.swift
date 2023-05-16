//
//  PlanetEntity+Extension.swift
//  PlanetInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation
import CoreData

extension PlanetEntity {
    
    static func creaetPlanetEntity(planet: Planet, moc: NSManagedObjectContext)-> PlanetEntity {
        
        let planetEntity = PlanetEntity(context: moc)
        planetEntity.name = planet.name
        planetEntity.gravity = planet.gravity
        planetEntity.climate = planet.climate
        planetEntity.url = planet.url
        return planetEntity
    }

    func toPlanet()-> Planet {
        return Planet(name:name ?? "", rotationPeriod:"", orbitalPeriod:"", diameter:"", climate:climate ?? "", gravity:gravity ?? "", terrain: "", surfaceWater: "", population:"", residents:[""], films:[""], created:"",edited:"",url:url ?? "")
    }
}
