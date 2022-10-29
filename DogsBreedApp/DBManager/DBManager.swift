//
//  DBManager.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import Foundation
import RealmSwift

class DBManager {
    private var database: Realm
    
    static let shared = DBManager()
    
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<RealmImageModel> {
        
        let results: Results<RealmImageModel> = database.objects(RealmImageModel.self)
        
        return results
    }
    
    func addData(object: RealmImageModel) {
        if !DBManager.shared.isEmpty() {
            for imageModel in DBManager.shared.getDataFromDB() {
                if object.breedName == imageModel.breedName {
                    object.images.append(objectsIn: imageModel.images)
                    do {
                        try database.write {
                            database.add(object, update: .all)
                            return
                        }
                    } catch {
                        return
                    }
                }
            }
        } else {
            do {
                try database.write {
                    database.add(object, update: .all)
                    return
                }
            } catch {
                return
            }
        }
    }
    
    func deleteAllFromDB() {
        try! database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(object: RealmImageModel) {
        try! database.write {
            database.delete(object)
        }
    }
    
    func isEmpty() -> Bool {
        return database.isEmpty
    }
}
