//
//  Parent.swift
//  Chorizard
//
//  Created by Tyler Donohue on 7/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import Foundation
import FirebaseFirestore

protocol ParentIdentifiable {
    var id: String? { get set }
}

protocol DocumentParentSerializable {
    init?(ParentDictionary: [String: Any])
}

struct Parent {
    
    var id: String
    var email: String
    var parentCurrencey: Int
    var parentToDoList: Array<Any>
    var isParent: Bool = true
    
    var dictionary: [String: Any] {
        return [
            
            "id": id,
            "email": email,
            "parentCurrencey": parentCurrencey,
            "parentToDoList": parentToDoList,
            "isParent": isParent
            
        ]
    }
}

extension Parent: DocumentParentSerializable {
    init?(ParentDictionary: [String: Any]) {
        guard let id = ParentDictionary["id"] as? String,
            let email = ParentDictionary["email"] as? String,
            let parentCurrencey = ParentDictionary["parentCurrencey"] as? Int,
            let parentToDoList = ParentDictionary["parenttoDoList"] as? Array<Any>,
            let isParent = ParentDictionary["isParent"] as? Bool else { return nil }
        
        self.init(id: id, email: email, parentCurrencey: parentCurrencey, parentToDoList: parentToDoList, isParent: isParent)
    }
    
}
