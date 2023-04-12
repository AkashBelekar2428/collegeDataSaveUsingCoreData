//
//  AppDelegate.swift
//  CollegeData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Directories",FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Data Not Found")
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = CollegeViewController.init()
        self.window?.makeKeyAndVisible()
        return true
    }


    // MARK: - Core Data stack
    //persistentContainer:- create and managing data

    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "CollegeData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
       
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    // save data

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

