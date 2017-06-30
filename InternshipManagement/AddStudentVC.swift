//
//  AddStudentVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class AddStudentVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var classPicker: UIPickerView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var avatarImg: UIImageView!
    
    //handel choose image with imagepicker
    private var imagePiker = UIImagePickerController()
    
    private var studentModel = StudentModel()
    private var classModel = ClassModel()
    private var listClass: [Class]!
    private var className: String!
    private let defaultAvatar = UIImage(named: "icons8-add_user_group")
    
    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classPicker.delegate = self
        classPicker.dataSource = self
        imagePiker.delegate = self // must implement UIImagePickerControllerDelegate, UINavigationControllerDelegate
        
        listClass = classModel.getClasses()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddStudentVC.handleTapGestureRecognizer(_:))))
        
        // doing edit
        if student != nil {
            self.cancelBtn.setTitle("Delete", for: .normal)
                self.saveBtn.setTitle("Update", for: .normal)
            self.updateUIToEdit(student: student)
        }
    }
    
    @IBAction func saveBtnPressed(_ button: UIButton) {
        
        //update student
        if button.titleLabel?.text == "Update" {
            self.updateStudent()
    
        }else {
        // add student
            addStudent()
        }
        navigationController?.popViewController(animated: true)
//        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(_ button: UIButton) {
        
        //delete student
        if button.titleLabel?.text == "Delete" {
            studentModel.deleteStudent(student: student)
        }
        navigationController?.popViewController(animated: true)
//        dismiss(animated: false, completion: nil)
    }
    
    //update student
    func updateStudent(){
        studentModel.updateStudent(student: student, name: nameTextField.text, avatar: avatarImg.image, toClass: listClass[classPicker.selectedRow(inComponent: 0)])
    }
    
    //add student
    func addStudent() {
        studentModel.addStudent(id: idTextField.text, name: nameTextField.text, avatar: avatarImg.image, toClass: listClass[classPicker.selectedRow(inComponent: 0)])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listClass.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listClass[row].name
    }

    //handle event tap blur the textfield
    @IBAction func handleTapGestureRecognizer(_ recognizer: UITapGestureRecognizer) {
        
        if recognizer.view == self.view {
            
            self.idTextField.endEditing(false)
            self.nameTextField.endEditing(false)
        }
    }
    
    //handle choose image
    @IBAction func changeImgBtnPressed(_ sender: Any) {
        
        //must config infor.plist file
//        Camera :
//
//        Key       :  Privacy - Camera Usage Description
//        Value     :  $(PRODUCT_NAME) camera use
//        Photo :
//        
//        Key       :  Privacy - Photo Library Usage Description
//        Value     :  $(PRODUCT_NAME) photo use
        
        imagePiker.allowsEditing = false
        imagePiker.sourceType = .photoLibrary
        present(imagePiker, animated: true, completion: nil)
    }
    
    //handle when choosed image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            avatarImg.contentMode = .scaleAspectFit
            avatarImg.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // update data in case edit student
    func updateUIToEdit(student: Student) {
        print(student.id!)
        self.idTextField.text = student.id!
        self.idTextField.allowsEditingTextAttributes = false
        self.nameTextField.text = student.name!
        self.avatarImg.image = student.avatar as? UIImage ?? defaultAvatar
        if let index = listClass.index(of: student.toClass!) {
            self.classPicker.selectRow(index, inComponent: 0, animated: true)

        }
    }
    
}
