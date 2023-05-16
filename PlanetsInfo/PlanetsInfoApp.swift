//
//  PlanetsInfoApp.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import SwiftUI

@main
struct PlanetsInfoApp: App {
    private let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            PlanetListView(viewModel: PlanetsViewModel())
            }
    }
}
