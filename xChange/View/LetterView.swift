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
    @State var letterCreate: Bool = false
    @ObservedObject var dataStore = DataStore.shared
    
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Letters")
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
            }
            //            Text("location status: \(locationManager.statusString)")
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(userLatitude) ?? 0, longitude: CLLocationDegrees(userLongitude) ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
                .padding()
                .frame(width: 400, height: 300)
            
            //            HStack {
            //                Text("latitude: \(userLatitude)")
            //                Text("longitude: \(userLongitude)")
            //            }
            //            Text("You haven't created any letters.")
            ScrollView {
                if dataStore.letters?.count == 0{
                    Label {
                        Text("You haven't created any letters.")
                            .fontWeight(.medium)
                            .font(.title2)
                    }
                icon: {
                }
                }
                else if let letters = dataStore.letters {
                    ForEach(letters, id: \.self) { item in
                        ListView(title: item.title, content: item.content)
                    }
                }
                
            }
            
            Spacer()
            Button(action:{
                self.letterCreate.toggle()
            }){
                HStack {
                    Text("Create a letter")
                }
                .foregroundColor(.white)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 0)
                )
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("#9296F0")))
            }
        }
        .padding()
        .sheet(isPresented: $letterCreate){
            LetterSheet()
        }
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView()
    }
}
