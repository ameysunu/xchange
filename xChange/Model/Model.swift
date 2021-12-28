//
//  Model.swift
//  xChange
//
//  Created by Amey Sunu on 27/12/21.
//

import Foundation

enum ActiveSheet: Identifiable {
    case first, second
    
    var id: Int {
        hashValue
    }
}
