//
//  MapView.swift
//  SwiftUI-Beginner
//
//  Created by eyup cimen on 14.02.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions : [MKCoordinateRegion] = [ MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.00 , longitude: 29.00) , span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)), MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.589865 , longitude: -0.118092) , span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))]
    
    @State var region : MKCoordinateRegion = regions[0]
    
    @State var selectedIndex = 0
    
    var body: some View {
    
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack{
                    Picker("Picker", selection: $selectedIndex, content: {
                        Text("Istanbul").tag(0)
                        Text("London").tag(1)
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectedIndex, perform: { value in
                        self.region = MapView.regions[selectedIndex]
                    })
                    Spacer()
                }
            )
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
