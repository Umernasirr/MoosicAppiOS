//
//  LoginViewController.swift
//  MoosicApp
//
//  Created by Remu on 04/01/2021.
//  Copyright © 2021 Umer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
               view.addGestureRecognizer(tap)
        }

    @IBAction func onLoginClick(_ sender: Any) {
        // Login button Pressed validations
        let sb = storyboard?.instantiateViewController(withIdentifier: "MusicTableViewController") as! MusicTableViewController
              navigationController?.pushViewController(sb, animated: true)
    }
    
    @IBAction func onSignupClick(_ sender: Any) {
        let sb = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
              navigationController?.pushViewController(sb, animated: true)
      
    }
    
}
