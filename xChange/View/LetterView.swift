//
//  LetterView.swift
//  xChange
//
//  Created by Amey Sunu on 02/01/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct LetterView: View {
    @StateObject var locationManager = LocationManager()
    
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        VStack {
            Text("location status: \(locationManager.statusString)")
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(userLatitude) ?? 0, longitude: CLLocationDegrees(userLongitude) ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
                .frame(width: 400, height: 300)
            HStack {
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
            }
        }
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView()
    }
}
