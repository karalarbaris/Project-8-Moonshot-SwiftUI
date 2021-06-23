//
//  Mission.swift
//  Project-8-Moonshot-SwiftUI
//
//  Created by Baris Karalar on 23.06.2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    var id: String
    var launchDate: Date?
    var crew: [CrewRole]
    var description: String
}
