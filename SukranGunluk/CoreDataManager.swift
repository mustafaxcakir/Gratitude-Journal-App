//
//  CoreDataManager.swift
//  SukranGunluk
//
//  Created by MustafaCan on 26.01.2024.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer: NSPersistentContainer
    
    
    init() {
    persistentContainer = NSPersistentContainer(name: "GratitudeDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core data store failed \(error.localizedDescription)")
            }
        }
    }
    
    func getAllGratitude() -> [GratitudeData] {
           let fetchRequest: NSFetchRequest<GratitudeData> = GratitudeData.fetchRequest()

           do {
               return try persistentContainer.viewContext.fetch(fetchRequest)
           } catch {
               return []
           }
       }
    
    func deleteGratitude(gratitude: GratitudeData) -> [GratitudeData] {
           persistentContainer.viewContext.delete(gratitude)
           
           do {
               try persistentContainer.viewContext.save()
           } catch {
               print("Failed to delete gratitude \(error)")
           }
           
           // Güncellenmiş veri kümesini döndürme
           return getAllGratitude()
       }

    
    
    func saveData(title: String, text: String, emoji: String, date: Date ) {
        let gratitude = GratitudeData(context: persistentContainer.viewContext)
        
        gratitude.gratitudeTitle = title
        gratitude.gratitudeText = text
        gratitude.gratitudeEmoji = emoji
        gratitude.gratitudeDate = date
        
        do {
            try persistentContainer.viewContext.save()
        }catch {
            print("Failed to save gratitude \(error)")
        }
        
    }
    
}
