//
//  GlobalView.swift
//  xChange
//
//  Created by Amey Sunu on 13/01/22.
//

import SwiftUI

struct GlobalView: View {
    var body: some View {
        VStack{
            HStack {
                Text("Go Premium!")
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
            }
            Image("pay")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding()
            
            Text("Unlock Global, to get letters from all over the globe, at €4.50")
            Spacer()
            Image("buttonPay")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding()
        }
        .padding()
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView()
    }
}
