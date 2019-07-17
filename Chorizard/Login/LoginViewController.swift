//
//  LoginViewController.swift
//  Chorizard
//
//  Created by Hayden Hoki on 7/17/19.
//  Copyright © 2019 Hayden Hoki. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "LoginSegue", sender: sender)
    }
}
