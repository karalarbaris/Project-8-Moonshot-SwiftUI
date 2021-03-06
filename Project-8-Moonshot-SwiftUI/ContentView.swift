//
//  ContentView.swift
//  Project-8-Moonshot-SwiftUI
//
//  Created by Baris Karalar on 21.06.2021.
//

import SwiftUI

//Using generics to load any kind of Codable data

//Loading a specific kind of Codable data

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingCrewNames = false
    
    var body: some View {
        
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image)
                        .resizable()
                        //Same as scaledToFit()
                        //                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(showingCrewNames ? crewNames(mission: mission): mission.formattedLaunchDate)
                    }
                    
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button(action: {
                showingCrewNames.toggle()
            }, label: {
                Text(showingCrewNames ? "Crew": "Date")
            }))

        }
        
        
        
    }
    
    func crewNames(mission: Mission) -> String {
        
        var missionNames = [String]()
        for crew in mission.crew {
            missionNames.append(crew.name.capitalized)
        }
        
        return missionNames.joined(separator: ", ")
    }
}


////Pushing new views onto the stack using NavigationLink
//
//struct ContentView: View {
//    var body: some View {
//
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink(
//                    destination: Text("Detail \(row)"),
//                    label: {
//                        Text("Row \(row)")
//                    })
//            }
//            .navigationBarTitle("SwiftUI")
//        }
//
////        NavigationView {
////            VStack {
////                NavigationLink(destination: Text("Detail View"), label: {
////                    Text("Helloo oowowoow")
////                })
////            }
////            .navigationBarTitle("SwiftUI")
////        }
//
//    }
//}





////How ScrollView lets us work with scrolling data
//
//struct CustomText: View {
//
//    var text: String
//
//    var body: some View {
//
//        Text(text)
//
//    }
//
//    init(text: String) {
//        print("creating a new custom text")
//        self.text = text
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//
//        //is creating all of them at once
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//
//        //creating it lazily
////        List {
////           ForEach(0..<100) {
////              CustomText(text: "Item \($0)")
////                 .font(.title)
////        } }
//
//    }
//}


//struct ContentView: View {
//    var body: some View {
//
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    Text("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//
//    }
//}

////Resizing images to fit the screen using GeometryReader
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Image("pic1")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geo.size.width)
//            }
//
////            Image("pic1")
////                .resizable()
////                .aspectRatio(contentMode: .fit)
////                .frame(width: 300, height: 300, alignment: .center)
//
//        }
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
