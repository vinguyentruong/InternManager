//
//  MentorCell.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/28/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class MentorCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    private var mentorModel = MentorModel()
    private var defaultImage = UIImage(named: "icons8-add_user_group")
    
    func configUICell(mentor: Mentor){
        mentorModel.downloadImage(id: mentor.ID, complete: {
            image, error in
            if error != nil {
                print(error.debugDescription)
            }
            self.profileImg.image = image
        })
        nameLbl.text = "name: " + mentor.name
    }
}
