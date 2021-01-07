//
//  SignUpViewController.swift
//  MoosicApp
//
//  Created by Remu on 04/01/2021.
//  Copyright © 2021 Umer. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    let headers = ["Content-Type":"application/json"];
    let parameter = ["MemberID": "aaaa@test.com", "MemberPW": "12345", "LoginType": "IDPW", "PushKey": "ios"];

    
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
//        // Do Signup Validation
//        Almofire.
        
//        Alamofire.request(loginApi, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { (response) in
//                switch response.result {
//                case .success:
//                    print("success",response)
//                case .failure(let error):
//                    print("failure",error)
//                }
//        }
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
