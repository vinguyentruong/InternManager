//
//  Class+CoreDataProperties.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/26/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var name: String?
    @NSManaged public var toStudent: NSSet?

}

// MARK: Generated accessors for toStudent
extension Class {

    @objc(addToStudentObject:)
    @NSManaged public func addToToStudent(_ value: Student)

    @objc(removeToStudentObject:)
    @NSManaged public func removeFromToStudent(_ value: Student)

    @objc(addToStudent:)
    @NSManaged public func addToToStudent(_ values: NSSet)

    @objc(removeToStudent:)
    @NSManaged public func removeFromToStudent(_ values: NSSet)

}
