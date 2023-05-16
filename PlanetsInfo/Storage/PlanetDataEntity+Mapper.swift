//
//  PlanetDataEntity+Mapper.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 16/05/23.
//

import Foundation


extension PlanetDataEntity {
    func mapToPanetData()-> PlanetData {
        
       let planetsModel =  self.planets.map {
           $0.allObjects.map { value in
               (value as? PlanetEntity)?.toPlanet()
           }
       }?.compactMap{ $0 } ?? []

        return PlanetData(count: Int(self.count), next: self.next ?? "", previous: self.previous, results:  planetsModel)
    }
}
