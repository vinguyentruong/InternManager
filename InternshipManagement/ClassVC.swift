//
//  ClassVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class ClassVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var classListTableView: UITableView!
    
    private var classList = [Class]()
    private var classModel = ClassModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classListTableView.delegate = self
        classListTableView.dataSource = self
        classModel.autoCreateClass()
        classList = classModel.getClasses()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let classCell = classListTableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as? ClassCell {
            classCell.configUI(classObj: classList[indexPath.row])
            return classCell
        }
        return UITableViewCell()
    }
}
