//
//  UserView.swift
//  xChange
//
//  Created by Amey Sunu on 13/01/22.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var dataStore = DataStore.shared
    
    var body: some View {
        VStack{
            HStack {
                Text("My Profile")
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
            }
            Text((dataStore.user?.name)!)

            Spacer()
        }
        .padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
