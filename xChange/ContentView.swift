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
            HomeView()
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

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
