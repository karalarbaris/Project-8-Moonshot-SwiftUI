//
//  ContentView.swift
//  Project-8-Moonshot-SwiftUI
//
//  Created by Baris Karalar on 21.06.2021.
//

import SwiftUI

//Resizing images to fit the screen using GeometryReader

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("pic1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
            
//            Image("pic1")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 300, alignment: .center)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
