//
//  MyProfileViewController.swift
//  MoosicApp
//
//  Created by Remu on 04/01/2021.
//  Copyright © 2021 Umer. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    
    @IBOutlet weak var txtFieldName: UITextField!
    
    @IBOutlet weak var txtFieldPass: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func handleClickSave(_ sender: Any) {
    }
    

    @IBAction func handleClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
}
