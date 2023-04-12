//
//  Collage+CoreDataProperties.swift
//  CollegeData
//
//  Created by Akash Belekar on 12/04/23.
//
//

import Foundation
import CoreData


extension Collage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collage> {
        return NSFetchRequest<Collage>(entityName: "Collage")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?
    @NSManaged public var university: String?

}

extension Collage : Identifiable {

}
