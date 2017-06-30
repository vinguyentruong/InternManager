//
//  TableViewCell.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    func configUI(student: Student) {
        avatarImg.image = student.avatar as? UIImage
        nameLbl.text = nameLbl.text! + student.name!
        classLbl.text = classLbl.text! + (student.toClass?.name!)!
        idLbl.text = idLbl.text! + student.id!
    }
}
