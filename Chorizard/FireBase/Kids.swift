//
//  Kids.swift
//  Chorizard
//
//  Created by Tyler Donohue on 7/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import Foundation
import FirebaseFirestore

protocol KidIdentifiable {
    var id: String? { get set }
}

struct Kids {
    
    var id: String
    var email: String
    var parent: String
    var kidCurrencey: Int
    var kidToDoList: Array<Any>
    var isParent: Bool = false
    
    var dictionary: [String: Any] {
        return [
            
            "id": id,
            "email": email,
            "parent": parent,
            "kidCurrencey": kidCurrencey,
            "kidToDoList": kidToDoList,
            "isParent": isParent
            
            
        ]
        
    }
}
