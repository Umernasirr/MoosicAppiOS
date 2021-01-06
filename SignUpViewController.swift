//
//  SignUpViewController.swift
//  MoosicApp
//
//  Created by Remu on 04/01/2021.
//  Copyright © 2021 Umer. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldUsername: UITextField!
    
    @IBOutlet weak var txtFieldPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickSignup(_ sender: Any) {
        // Do Signup Validation
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
