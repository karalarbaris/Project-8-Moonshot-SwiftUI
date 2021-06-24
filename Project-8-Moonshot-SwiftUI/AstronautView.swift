//
//  AstronautView.swift
//  Project-8-Moonshot-SwiftUI
//
//  Created by Baris Karalar on 23.06.2021.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    var astronautMissions = [String]()
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    Text("Missions attended")
                    ForEach(astronautMissions, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        
    }

    init(astronaut: Astronaut) {

        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        for mission in missions {
            for crew in mission.crew {
                if crew.name == astronaut.id {
                    astronautMissions.append("\(mission.displayName)")
                }
            }
        }
        
        
    }

    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
