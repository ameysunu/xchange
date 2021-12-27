//
//  WelcomeView.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Image("welcome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
            
            Text("Welcome to")
                .font(.system(size: 35))
                .fontWeight(.bold)
            
            Text("xChange")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color("#9296F0"))
            Spacer()
            Button(action:{
                
            }) {
                Text("Continue")
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
