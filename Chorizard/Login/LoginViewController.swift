//
//  LoginViewController.swift
//  Chorizard
//
//  Created by Hayden Hoki on 7/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    var db: Firestore!
    var userId: String = ""
    let userDefault = UserDefaults.standard
    let googleLogInButton = GIDSignInButton(frame: CGRect(x: 120, y: 250, width: 250, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        db = Firestore.firestore()
        changeBackground()
    }
    
    func whiteStatusBar() -> UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    func changeBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Gradient")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "LoginSegue", sender: sender)
    }
}
