//
//  DataBaseHelper.swift
//  CollegeData
//
//  Created by Akash Belekar on 12/04/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper:NSManagedObject{
    
    static let sharedInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Save Data
    func saveData(collageData:[String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "Collage", into: context) as? Collage
        college!.name = collageData["collageName"]
        college!.city = collageData["collageCity"]
        college!.address = collageData["collageAddress"]
        college!.university = collageData["collageUniversity"]
        
        do {
            try context.save()
        } catch let error {
            print("Data Not saved yet..\(error.localizedDescription)")
        }
    }
    
    // Fetch data show on tableView
    func getCollageData() -> [Collage]{
        var college = [Collage]()
        
        //fetch data in entity using NSFetchRequest
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Collage")
        
        do {
            college =  try context.fetch(fetchRequest) as! [Collage]
        } catch let err {
            print("Data not to be fetched..\(err.localizedDescription)")
        }
        return college
        
    }
    //Delete tableViewdata on row
    func deleteCollageData(index:Int) -> [Collage]{
        var collage = getCollageData()
        context.delete(collage[index]) //delete from coredata
        collage.remove(at: index) //delete from array (collage)
        
        do {
            try context.save()
        } catch let error {
            print("error",error.localizedDescription)
        }
        return collage
        
    }
    
    //edit data
    
    func editCollegeData(collegeData:[String:String], index:Int){
        var college = getCollageData()
        college[index].name = collegeData["collageName"]
        college[index].city = collegeData["collageCity"]
        college[index].address = collegeData["collageAddress"]
        college[index].university = collegeData["collageUniversity"]
        
        do {
            try context.save()
        } catch  {
            print("error in edit data")
        }
        
    }
}
