//
//  OtherView.swift
//  xChange
//
//  Created by Amey Sunu on 13/01/22.
//

import SwiftUI
import RealmSwift

struct OtherView: View {
    
    @ObservedObject var dataStore = DataStore.shared
    @State private var userData = try! Realm().objects(UserData.self)
    
    var body: some View {
        VStack{
            HStack {
                Text("Letters")
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
            }
            ScrollView {
                if dataStore.allLetters?.count == 0{
                    Label {
                        Text("No Letters available")
                            .fontWeight(.medium)
                            .font(.title2)
                    }
                icon: {}
                }
                else if let letters = dataStore.allLetters {
                    ForEach(letters, id: \.self) { item in
                        ListView(title: item.title, content: item.content)
                    }
                }
                
            }
        }
        .padding()
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
