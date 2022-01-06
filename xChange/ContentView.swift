//
//  ContentView.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    init (){
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        uid = String(app.currentUser?.id ?? "")
        print(uid as Any)
    }
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
