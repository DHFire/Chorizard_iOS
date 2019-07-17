//
//  Kid.swift
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

protocol DocumentKidSerializable {
    init?(kidDictionary: [String: Any])
}

struct Kid {
    
    var id: String
    var email: String
    var kidCurrencey: Int
    var kidToDoList: Array<Any>
    var isParent: Bool = false
    
    var dictionary: [String: Any] {
        return [
            
            "id": id,
            "email": email,
            "kidCurrencey": kidCurrencey,
            "kidToDoList": kidToDoList,
            "isParent": isParent
            
        ]
    }
}

extension Kid: DocumentKidSerializable {
    init?(kidDictionary: [String: Any]) {
        guard let id = kidDictionary["id"] as? String,
            let email = kidDictionary["email"] as? String,
            let kidCurrencey = kidDictionary["kidCurrencey"] as? Int,
            let kidToDoList = kidDictionary["kidToDoList"] as? Array<Any>,
            let isParent = kidDictionary["isParent"] as? Bool else { return nil }
                self.init(id: id, email: email, kidCurrencey: kidCurrencey, kidToDoList: kidToDoList, isParent: isParent)
    }
}
