//
//  ClassModel.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import CoreData

class ClassModel {
    
    func addClass(name: String){
        let classObj = Class(context: context)
        classObj.name = name
        appDelegate.saveContext()
    }
    
    func autoCreateClass() {
        
        if UserDefaults.standard.bool(forKey: "created") {
            
        } else {
            
            addClass(name: "13T4")
            addClass(name: "13T3")
            addClass(name: "13T2")
            addClass(name: "13T1")
            UserDefaults.standard.set(true, forKey: "created")
        }
    }
    
    func getClasses() -> [Class] {
        
        let classFetchRequest: NSFetchRequest<Class> = Class.fetchRequest()
        
        do {
            
            let classes = try context.fetch(classFetchRequest)
            return classes
        } catch {
            
            let error = error as NSError
            print("\(error)")
        }
        
        return []
    }

}
