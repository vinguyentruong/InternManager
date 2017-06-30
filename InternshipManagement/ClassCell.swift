//
//  ClassCell.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var studentCountLbl: UILabel!
    
    func configUI(classObj: Class) {
        nameLbl.text = classObj.name
        studentCountLbl.text = studentCountLbl.text!+"\(classObj.toStudent?.count ?? 0)"
    }
}
