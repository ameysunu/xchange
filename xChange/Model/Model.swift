//
//  Model.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import Foundation
import SwiftUI

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
