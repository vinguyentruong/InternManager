//
//  SignVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/27/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignVC: UIViewController {

    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signBtnPressed(_ sender: Any) {
        self.sign(name: nameTextField.text!, pass: passTextField.text!)
    }
    
    func sign(name: String, pass: String){
        if name.isEmpty {
            let alertController = UIAlertController(title: "Errors", message: "Please input your name or email!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }else {
            Auth.auth().createUser(withEmail: name, password: pass, completion: {
                user,error in
                if error == nil {
                    print("you are sign successful!")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    self.performSegue(withIdentifier: "loginUser", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
    }

}
