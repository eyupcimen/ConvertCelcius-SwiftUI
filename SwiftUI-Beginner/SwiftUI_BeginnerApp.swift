//
//  SwiftUI_BeginnerApp.swift
//  SwiftUI-Beginner
//
//  Created by eyup cimen on 13.02.2021.
//

import SwiftUI

@main
struct SwiftUI_BeginnerApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ContentView()
                    .tabItem {
                        HStack{
                            Image(systemName: "thermometer.sun.fill" )
                            Text("Conversion")
                        }
                    }
                MapView()
                    .tabItem {
                        HStack{
                            Image(systemName: "map" )
                            Text("Map")
                        }
                    }
            }
            .accentColor(.orange)
        }
    }
}
