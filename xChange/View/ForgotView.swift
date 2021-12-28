//
//  ForgotView.swift
//  xChange
//
//  Created by Amey Sunu on 28/12/21.
//

import SwiftUI

struct ForgotView: View {
    @State var email: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Recover account")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Text("Don't worry, if you forget your password. We got you.")
                    .foregroundColor(.gray)
                Spacer()
            }
            Image("forgot")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
            TextField("",text: $email)
                .placeholder(when: email.isEmpty){
                    Text("Email").foregroundColor(Color("#9296F0"))
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 5.0)
                            .stroke(Color("#9296F0"), lineWidth: 1.0))
                .padding(.bottom, 20)
                .padding(.top, 20)
                .autocapitalization(.none)
            Spacer()
            Button(action:{
                
            }) {
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

struct ForgotView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotView()
    }
}
