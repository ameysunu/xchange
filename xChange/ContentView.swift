//
//  ContentView.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if app.currentUser != nil {
            LoadView()
                .preferredColorScheme(.light)
        } else {
            WelcomeView()
                .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
