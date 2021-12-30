//
//  LoadList.swift
//  xChange
//
//  Created by Amey Sunu on 30/12/21.
//

import SwiftUI

struct LoadList: View {
    
    @State var icon: String
    @State var textHead: String
    @State var textBody: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
                .foregroundColor(Color("#9296F0"))
            Spacer()
            VStack(alignment: .leading){
                Text(textHead)
                    .fontWeight(.bold)
                Text(textBody)
                    .foregroundColor(.gray)
                
            }
            
        }
    }
}

struct LoadList_Previews: PreviewProvider {
    static var previews: some View {
        LoadList(icon: "paperplane", textHead: "Send", textBody: "Send letters to people from different countries and learn a lot more about their culture and background.")
    }
}
