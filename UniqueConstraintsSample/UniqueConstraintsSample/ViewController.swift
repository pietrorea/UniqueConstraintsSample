//
//  ViewController.swift
//  UniqueConstraintsSample
//
//  Created by Pietro Rea on 11/15/15.
//  Copyright © 2015 Pietro Rea. All rights reserved.
//

import UIKit
import CoreData

private let SampletEntityName = "SampleEntity"

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveJohn(sender: AnyObject) {
        
        
        let sampleEntity = NSEntityDescription.insertNewObjectForEntityForName(SampletEntityName,
            inManagedObjectContext: context) as! SampleEntity
        sampleEntity.name = "John"
        
        do {
            try context.save()
            printAllSampleEntities()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    func printAllSampleEntities() {
        let fetchRequest = NSFetchRequest(entityName: SampletEntityName)
        
        do {
            let results =
            try context.executeFetchRequest(fetchRequest) as! [SampleEntity]
            for sampleEntity in results {
                print("name: \(sampleEntity.name!)")
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
}

