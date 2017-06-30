//
//  MentorModel.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/28/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

class MentorModel {
    
    var ref: DatabaseReference!
    var storageRef = Storage.storage().reference().child("images")
    init() {
        ref = Database.database().reference()
    }
    
    func addMentor(mentor: Mentor, complete: @escaping (Error?)->()) {
        uploadImage(id: mentor.ID, image: mentor.profile, complete: {
            error in
            if error == nil {
                complete(error)
                return
            }
        })
        let mentorDict = ["name": mentor.name]
        self.ref.child("mentors").child(mentor.ID).setValue(mentorDict)
        
    }
    
    func getMentors(complete: @escaping ([Mentor])->Void){
        var mentors: [Mentor] = []
        ref.child("mentors").observeSingleEvent(of: .value, with: {
            (snapshot) in
            var mentorDicts: NSDictionary?
            if let mentorDict = snapshot.value as? NSDictionary{
                mentorDicts = mentorDict
            }
            let mentorIDs = mentorDicts?.allKeys
            if mentorIDs != nil {
                for id in mentorIDs! {
                    let mentorId = id as? String
                    let name = (mentorDicts?[id] as! NSDictionary)["name"] as! String
                    mentors.append(Mentor(ID: mentorId!, name: name))
                }
            }
            complete(mentors)
        }) {
            (error) in
            print(error.localizedDescription)
        }
    }
    
    func uploadImage(id: String, image: UIImage, complete: @escaping (Error?)->()){
        let imageResize = resizeImage(image: image)
        let data = UIImagePNGRepresentation(imageResize!)
        let _ = storageRef.child(id + ".png").putData(data!, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                print("Error upload image")
                return
            }
            let _ = metadata.downloadURL
            complete(error)
        }
    }
    
    func downloadImage(id: String, complete: @escaping (UIImage? ,Error?)->()){
        storageRef.child(id+".png").getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                complete(nil,error)
                print("Data: \(data)")
                print("Error: \(error)")
                return
            } else {
                let image = UIImage(data: data!)
                complete(image,nil)
            }
        }
    }
    
    private func resizeImage(image: UIImage) -> UIImage? {
        
        var maxSize = image.size.width
        
        if maxSize < image.size.height {
            maxSize = image.size.height
        }
        
        let SCALE_SIZE: CGFloat = 320
        if maxSize < SCALE_SIZE {
            return image
        }
        
        let newSize = CGSize(width: image.size.width * SCALE_SIZE / maxSize, height: image.size.height * SCALE_SIZE / maxSize)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
