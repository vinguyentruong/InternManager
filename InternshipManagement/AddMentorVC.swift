//
//  AddMentorVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/28/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class AddMentorVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var IdTextField: UITextField!
    
    @IBOutlet weak var profileImgView: UIImageView!
    
    private var mentorModel = MentorModel()
    private var imagePiker = UIImagePickerController()
    private let defaultAvatar = UIImage(named: "icons8-add_user_group")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePiker.delegate = self
    }

    @IBAction func addImageBtnPressed(_ sender: Any) {
        imagePiker.allowsEditing = false
        imagePiker.sourceType = .photoLibrary
        present(imagePiker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImgView.contentMode = .scaleAspectFit
            profileImgView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        mentorModel.addMentor(mentor: Mentor(ID: IdTextField.text!, name: nameTextField.text!, profile: profileImgView.image), complete: {
            error in
            if error == nil {
                let alert = UIAlertController(title: "Error", message: "Can not upload image", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
            }
        })
        navigationController?.popViewController(animated: true)
    }
}
