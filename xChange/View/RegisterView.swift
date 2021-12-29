//
//  RegisterView.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import SwiftUI
import RealmSwift

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPass: String = ""
    
    @State var alertItem: AlertItem?
    
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
                if email.isEmpty{
                    self.alertItem = AlertItem(title: Text("Error"), message: Text("Email cannot be empty"), dismissButton: .default(Text("Done")))
                } else {
                    if password == confirmPass {
                        realmRegister(email: email, password: password){
                            (success) -> Void in
                            if success {
                                self.alertItem = AlertItem(title: Text("Success"), message: Text("Successfully created an account."), dismissButton: .default(Text("Done")))
                            } else {
                                self.alertItem = AlertItem(title: Text("Error"), message: Text(e), dismissButton: .default(Text("Done")))
                            }
                        }
                    } else {
                        self.alertItem = AlertItem(title: Text("Error"), message: Text("Passwords do not match."), dismissButton: .default(Text("Done")))
                    }
                }
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
        .alert(item: $alertItem){ item in
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
