//
//  Model.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import Foundation
import SwiftUI
import RealmSwift

enum ActiveSheet: Identifiable {
    case first, second
    
    var id: Int {
        hashValue
    }
}

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button
}

class UserData: Object, Identifiable {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var image: NSData?
}
