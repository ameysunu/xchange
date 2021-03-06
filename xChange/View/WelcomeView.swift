//
//  WelcomeView.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import SwiftUI
import Network

struct WelcomeView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var keyboardHandler = KeyboardHandler()
    @State var activeSheet: ActiveSheet?
    @State var loggedIn: Bool = false
    
    @State var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
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
                VStack{
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
                        .autocapitalization(.none)
                    HStack {
                        Spacer()
                        Button(action:{
                            activeSheet = .first
                        }){
                            Text("Forgot Password?")
                        }
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: LoadView().navigationBarHidden(true),isActive: $loggedIn) {
                        Button(action:{
                            realmLogin(email: email, password: password){
                                (success) -> Void in
                                if success {
                                    print("done")
                                    self.loggedIn = true
                                } else {
                                    print("failed")
                                    self.alertItem = AlertItem(title: Text("Error"), message: Text(e), dismissButton: .default(Text("Done")))
                                }
                            }
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
                    
                    Button(action:{
                        activeSheet = .second
                    }){
                        Text("I'm new here. Create an account?")
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
            .alert(item: $alertItem){ item in
                Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
            }
            
            .sheet(item: $activeSheet){ item in
                switch item {
                case .first:
                    ForgotView()
                case .second:
                    RegisterView()
                }
                
            }
            .navigationBarHidden(true)
            .frame(maxHeight: .infinity)
            .padding(.bottom, keyboardHandler.keyboardHeight)
        }
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
