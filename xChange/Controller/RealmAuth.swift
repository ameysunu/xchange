//
//  RealmAuth.swift
//  xChange
//
//  Created by Amey Sunu on 29/12/21.
//

import Foundation
import RealmSwift
import Realm

let app = App(id: "swiftapp-ebdla")
typealias success = Bool
var uid: String?

func realmLogin(email:String, password:String, completion: @escaping (success) -> Void){
    app.login(credentials: Credentials.emailPassword(email: email, password: password)) { (result) in
        switch result {
        case .failure(let error):
            print("Login failed: \(error.localizedDescription)")
            //e = "Login Failed: \(error.localizedDescription)"
            completion(false)
        case .success(let user):
            print("Successfully logged in as user \(user)")
            uid = user.id
            completion(true)
        }
    }
}
