//
//  LoadView.swift
//  xChange
//
//  Created by Amey Sunu on 30/12/21.
//

import SwiftUI

struct LoadView: View {
    var body: some View {
        VStack {
            Image("load")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .padding()
            Text("Getting Started")
                .font(.system(size: 35))
                .fontWeight(.heavy)
            Text("with xChange")
                .font(.system(size: 35))
                .fontWeight(.heavy)
                .foregroundColor(Color("#9296F0"))
            
            LoadList(icon: "paperplane", textHead: "Send", textBody: "Send letters to people from different countries and learn a lot more about their culture and background.")
                .padding(.top, 10)
            LoadList(icon: "person.fill.viewfinder", textHead: "Privacy", textBody: "Refrain from sending personal details and data to strangers.")
                .padding(.top, 10)
            Spacer()
            Button(action:{}){
                Text("Continue")
                    .fontWeight(.medium)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 0)
                    )
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("#9296F0")))
            }
            
        }
        .padding()
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
