//
//  LoginVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/27/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        loginUser(name: nameTextField.text!, pass: passTextField.text!)
    }
    
    func loginUser(name: String, pass: String){
        if name.isEmpty || pass.isEmpty{
            let alertVC = UIAlertController(title: "Errors", message: "Please input your email or password", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertVC.addAction(alertAction)
            present(alertVC, animated: true, completion: nil)
        }else {
            Auth.auth().signIn(withEmail: name, password: pass, completion: {
                user, error in
                if error == nil {
                    print("Login success!")
                    let currentUser = User(ID: (user?.uid)!, name: name, pass: pass)
                    
                    self.performSegue(withIdentifier: "loginSuccess", sender: currentUser)
                }else {
                    let alertVC = UIAlertController(title: "Errors", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertVC.addAction(alertAction)
                    self.present(alertVC, animated: true, completion: nil)
                }
            })
        }
        
    }
}
