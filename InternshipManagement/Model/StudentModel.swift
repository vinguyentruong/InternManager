//
//  StudentModel.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Student {
    
    func setInfor(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

class StudentModel {
    
    init() {
        
    }
    
    func updateStudent(student: Student, name: String? = nil, avatar: UIImage? = nil, toClass: Class? = nil) {
        
        student.name = name
        student.avatar = avatar
        student.toClass = toClass
        appDelegate.saveContext()

    }
    
    func addStudent(id: String? = nil, name: String? = nil, avatar: UIImage? = nil, toClass: Class? = nil) {
        
        let newStudent = Student(context: context)
        newStudent.id = id
        newStudent.name = name
        newStudent.avatar = avatar
        newStudent.toClass = toClass
        appDelegate.saveContext()
    }
    
    func getStudents() -> [Student] {
        
        let studentFetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            
            let students = try context.fetch(studentFetchRequest)
            return students
        } catch {
            
            let error = error as NSError
            print("\(error)")
        }
        
        return []
    }
    
    func getStudent(byID id: String) -> Student? {
        let studentFetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        studentFetchRequest.predicate = NSPredicate(format: "id == %@", argumentArray: [id])

        do {
            
            let students = try context.fetch(studentFetchRequest)
            if students.count > 0 {
                return students[0]
            }
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        print("Have no student!")
        return nil
    }
    
    func deleteStudent(byID id: String){
        let student = getStudent(byID: id)
        context.delete(student!)
        appDelegate.saveContext()
    }
    
    func deleteStudent(student: Student){
        context.delete(student)
        appDelegate.saveContext()
    }
    
}
