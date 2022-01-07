//
//  RealmAuth.swift
//  xChange
//
//  Created by Amey Sunu on 29/12/21.
//

import Foundation
import RealmSwift
import SwiftUI

let app = App(id: "swiftapp-ebdla")
typealias success = Bool
var uid: String?
var e: String = ""

func realmLogin(email:String, password:String, completion: @escaping (success) -> Void){
    app.login(credentials: Credentials.emailPassword(email: email, password: password)) { (result) in
        switch result {
        case .failure(let error):
            print("Login failed: \(error.localizedDescription)")
            e = "Login Failed: \(error.localizedDescription)"
            completion(false)
        case .success(let user):
            print("Successfully logged in as user \(user)")
            uid = user.id
            completion(true)
        }
    }
}

func realmRegister(email:String, password:String, completion: @escaping (success) -> Void){
    let client = app.emailPasswordAuth
    let email = email
    let password = password
    client.registerUser(email: email, password: password) { (error) in
        guard error == nil else {
            print("Failed to register: \(error!.localizedDescription)")
            e = "Failed to register: \(error!.localizedDescription)"
            completion(false)
            return
        }
        completion(true)
        print("Successfully registered user.")
    }
    
}

func uploadImage(image: UIImage ,completion: @escaping (success) -> Void){
    let data = NSData(data: image.jpegData(compressionQuality: 0.9)!)
    var myblob = UserData()
    myblob.image = data
    myblob.id = app.currentUser?.id
    
    let realm = try! Realm()
    
    if myblob.image!.length > 100000 {
        completion(false)
    } else {
        try! realm.write {
            realm.add(myblob)
            completion(true)
        }
    }
}
