//
//  Student+CoreDataProperties.swift
//  CollegeData
//
//  Created by Akash Belekar on 13/04/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?

}

extension Student : Identifiable {

}
