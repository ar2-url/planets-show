//
//  PlanetData.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import Foundation

// MARK: - PlanetData
struct PlanetData: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Planet]
}

// MARK: - Planet
struct Planet: Decodable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

extension Planet:Identifiable{
    static func someMockPlanet() -> Planet {
        return Planet(name:"Tatooine", rotationPeriod:"23", orbitalPeriod:"304", diameter:"", climate:"", gravity:"", terrain: "", surfaceWater: "", population:"", residents:[""], films:[""], created:"",edited:"",url:"")
    }
}
