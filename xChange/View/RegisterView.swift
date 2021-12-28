//
//  RegisterView.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPass: String = ""
    
    var body: some View {
            VStack {
                Image("register")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding()
                HStack {
                    Text("Register")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                    Spacer()
                }
                TextField("",text: $email)
                    .placeholder(when: email.isEmpty){
                        Text("Email").foregroundColor(Color("#9296F0"))
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color("#9296F0"), lineWidth: 1.0))
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                SecureField("",text: $password)
                    .placeholder(when: email.isEmpty){
                        Text("Password").foregroundColor(Color("#9296F0"))
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color("#9296F0"), lineWidth: 1.0))
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                
                SecureField("",text: $confirmPass)
                    .placeholder(when: email.isEmpty){
                        Text("Confirm Password").foregroundColor(Color("#9296F0"))
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color("#9296F0"), lineWidth: 1.0))
                    .autocapitalization(.none)
                Spacer()
                Button(action:{
                    
                }) {
                    Text("Register")
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
