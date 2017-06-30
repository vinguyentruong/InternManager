//
//  Student+CoreDataProperties.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import CoreData


extension Student {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var avatar: NSObject?
    @NSManaged public var toClass: Class?

}
