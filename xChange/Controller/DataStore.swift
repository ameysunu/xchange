//
//  DataStore.swift
//  xChange
//
//  Created by Amey Sunu on 10/01/22.
//

import Foundation
import SwiftUI
import RealmSwift

class DataStore: NSObject, ObservableObject {
    static let shared = DataStore()
    
    @Published
    var user: UserData?
    
    @Published
    var letters: Results<UserLetters>?
    var allLetters: Results<UserLetters>?
    
    private var token: NotificationToken? = nil
    private var realm = try! Realm()
    
    // MARK: - Object Lifecycle
    override private init() {
        super.init()
        fetchData()
        addObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    private func fetchData() {
        user = realm.objects(UserData.self).filter("id = '\(uid!)'").first
        letters = realm.objects(UserLetters.self).filter("id = '\(uid!)'")
        allLetters = realm.objects(UserLetters.self)
    }
    
    private func addObserver() {
        token = realm.observe { notification, realm in
            self.fetchData()
        }
    }
}
