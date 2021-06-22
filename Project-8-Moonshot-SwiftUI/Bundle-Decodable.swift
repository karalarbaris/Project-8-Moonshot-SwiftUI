//
//  Bundle-Decodable.swift
//  Project-8-Moonshot-SwiftUI
//
//  Created by Baris Karalar on 22.06.2021.
//

import Foundation

extension Bundle {
    
    func decode(_ file: String) -> [Astronaut] {
        
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}