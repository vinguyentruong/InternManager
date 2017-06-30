//
//  MentorVC.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/28/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import UIKit

class MentorVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mentorTableView: UITableView!
    private var mentorModel = MentorModel()
    private var listMentor = [Mentor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mentorTableView.delegate = self
        mentorTableView.dataSource = self
    }
    
    func loadData(complete: @escaping ()->()){
            }
    override func viewDidAppear(_ animated: Bool) {
        mentorModel.getMentors(complete: {
            mentors in
            self.listMentor = mentors
            self.mentorTableView.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMentor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let mentorCell = mentorTableView.dequeueReusableCell(withIdentifier: "mentorCell", for: indexPath) as? MentorCell {
            mentorCell.configUICell(mentor: listMentor[indexPath.row])
            return mentorCell
        }
        return UITableViewCell()
    }
}
