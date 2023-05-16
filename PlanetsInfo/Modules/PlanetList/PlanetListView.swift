//
//  ContentView.swift
//  PlanetsInfo
//
//  Created by Artur Knul on 19/04/2023.
//

import SwiftUI
import CoreData

struct PlanetListView: View {
    
    @StateObject var viewModel: PlanetsViewModel
    @State var isError: Bool = true
    var body: some View {
        NavigationView {
            VStack{
                if viewModel.planets.count == 0 {
                    ProgressView()
                }else {
                    if viewModel.error != nil {
                        ProgressView().alert(isPresented: $isError) {
                            Alert(title: Text(viewModel.error?.errorDescription ?? ""), message: Text("Try Again"), dismissButton: .default(Text("Okay")))
                        }
                    }else{
                        List {
                            ForEach(viewModel.planets) { planet in
                                NavigationLink {
                                    PlanetsDetails(planet: planet)
                                } label: {
                                    Text(" \(planet.name)")
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getPlanets(NetworkAPIEndPoints.PlantsListEndPoint)
                if(viewModel.error != nil){
                    isError = true
                }
            }
            .navigationTitle(Text("Planets"))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView(viewModel: PlanetsViewModel())
    }
}
