//
//  WeatherDataManager.swift
//  WeatherLogger
//
//  Created by Swati on 26/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import UIKit
import CoreData

struct WeatherDataManager: WeatherDataInterface {
    private struct Constants {
        static let wheatherData = "WeatherLog"
    }
    
    private let application: UIApplication
    
    init(application: UIApplication = UIApplication.shared) {
        self.application = application
    }
    
    func saveData(model: WeatherViewModel,
                  completionBlock: @escaping ((Error?) -> Void)) {
        guard let appDelegate =
            application.delegate as? AppDelegate else {
                return
        }
        
        let managedContext : NSManagedObjectContext =
            NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        managedContext.parent = appDelegate.persistentContainer.viewContext
        
        let weather = NSEntityDescription.insertNewObject(forEntityName: Constants.wheatherData, into: managedContext) as? WeatherLog
        weather?.city = model.city
        weather?.coordinate = model.coordinate
        weather?.country = model.country
        weather?.temperature = model.temperature
        weather?.date = Date()
        weather?.id = UUID()
        
        do {
            try managedContext.save()
            completionBlock(nil)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            completionBlock(error)
        }
    }
    
    func retrieveData() -> Array<WeatherLog>?  {
        var fetchedResults: Array<WeatherLog>? = nil
        
        guard let appDelegate =
            application.delegate as? AppDelegate else {
                return fetchedResults
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: Constants.wheatherData)
        do {
            fetchedResults = try managedContext.fetch(fetchRequest) as? [WeatherLog]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
        return fetchedResults
    }
}
