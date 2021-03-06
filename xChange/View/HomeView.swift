//
//  HomeView.swift
//  xChange
//
//  Created by Amey Sunu on 02/01/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            LetterView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
           OtherView()
                .tabItem {
                    Image(systemName: "paperplane")
                    Text("Letters")
                }
            GlobalView()
                 .tabItem {
                     Image(systemName: "globe.europe.africa")
                     Text("Global")
                 }
            
           UserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User Details")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
