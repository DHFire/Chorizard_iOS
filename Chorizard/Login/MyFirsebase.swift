//
//  MyFirsebase.swift
//  Chorizard
//
//  Created by Tyler Donohue on 7/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FirebaseFirestore
import Firebase

class MyFirebase {
    
    static let shared = MyFirebase()
    var db = Firestore.firestore()
    var currentAuthID = Auth.auth().currentUser?.uid
    var currentUser: User?
    var userId: String? = ""
    private var listenHandler: AuthStateDidChangeListenerHandle?
    
    func addUserListender(loggedIn: Bool) {
        print("Add listener")
        listenHandler = Auth.auth().addStateDidChangeListener{ (auth, user) in
            if user == nil {
                //logged Out
                print("You Are Currently Logged Out")
                self.currentUser = nil
                self.userId = ""
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    if loggedIn {
                        //move to account 
                    } else {
                        //move to log in
                    }
                }
            } else {
                // check for docuemnt named the same as their user id, if it does not exist it will create a document for them to use, otherwise nothing will happen. should should only be called once when they user logs in and never again unless their account is deleted.
                print("Logged In")
                let userReff = self.db.collection("kid or parent here").document("\(String(describing: self.userId))")
                userReff.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        print("data already added: \(dataDescription)")
                    } else {
                        self.createParentData()
                        print("document added to fireStore")
                    }
                    self.currentUser = user
                    self.userId = (user?.uid)!
                    print("UserID: \(self.userId ?? "no ID")")
                    //load data here
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                    //move to account
                    }
                }
            }
        }
    }
    
    func createParentData()  {
        
        let id: String = ""
        let email: String = ""
        let parentCurrencey: Int = 0
        let parentToDoList: Array<Any> = []
        let isParent: Bool = true
        let parentRef = self.db.collection("parent")
        let parent = Parent(id: id, email: email, parentCurrencey: parentCurrencey, parentToDoList: parentToDoList, isParent: isParent)
        parentRef.document(String(parent.id)).setData(parent.dictionary){ err in
            if err != nil {
                print(Error.self)
            } else {
                print("Parent Added Data")
            }
        }
    }
    
    func createKidData() {
        
        let id: String = ""
        let email: String = ""
        let kidCurrencey: Int = 0
        let kidToDoList: Array<Any> = []
        let isParent: Bool = false
        let KidRef = self.db.collection("kid")
        let kid = Kid(id: id, email: email, kidCurrencey: kidCurrencey, kidToDoList: kidToDoList, isParent: isParent)
        KidRef.document(String(kid.id)).setData(kid.dictionary){ err in
            if err != nil {
                print(Error.self)
            } else {
                print("Added Data")
            }
        }
    }
    
    //listen info
    func removeUserListener() {
        guard listenHandler != nil else {
            return
        }
        Auth.auth().removeStateDidChangeListener(listenHandler!)
    }
    
    func isLoggedIn() -> Bool {
        return(currentUser != nil)
    }
    
    func liknCredential(credential: AuthCredential) {
        currentUser?.linkAndRetrieveData(with: credential) {
            (user, error) in
            
            if let error = error {
                print(error)
                return
            }
            print("Credential linked")
        }
    }
    func logOut() {
        try! Auth.auth().signOut()
        GIDSignIn.sharedInstance()?.signIn()
    }
    
}
