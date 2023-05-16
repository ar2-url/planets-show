//
//  PlanetsDetails.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import SwiftUI

struct PlanetsDetails: View {
    let planet:Planet
    var body: some View {
        VStack(alignment: .leading){
            Text("Name- \(planet.name)").font(.title)
            Text("Gravity- \(planet.gravity)").font(.body)
            Text("Climate- \(planet.climate)").font(.body)
        }
        Spacer()
    }
}

struct PlanetsDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsDetails(planet: Planet.someMockPlanet())
    }
}
