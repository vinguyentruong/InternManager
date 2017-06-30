//
//  ListStudentVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import UIKit

class ListStudentVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var listStudentTableView: UITableView!
    
    private var listStudent: [Student] = [Student]()
    private var studentModel = StudentModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listStudentTableView.delegate = self
        listStudentTableView.dataSource = self
    }
    
    // update data of tableview after add student
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listStudent = studentModel.getStudents()
        self.listStudentTableView.reloadData()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "addStudent", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStudent.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addStudent", sender: listStudent[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addStudent") {
            if let addStudentVC = segue.destination as? AddStudentVC{
                if let student = sender as? Student {
                    addStudentVC.student = student
                }
            }
        }
    }
    
    // load data for UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let studentCell = listStudentTableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as? StudentCell {
            studentCell.configUI(student: listStudent[indexPath.row])
            return studentCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            studentModel.deleteStudent(byID: listStudent[indexPath.row].id!)
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
}
