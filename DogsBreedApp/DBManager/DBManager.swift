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
    
    func getData(with breedNames: [String]) -> [RealmImageModel] {
        let results: Results<RealmImageModel> = database.objects(RealmImageModel.self)
        var resultToSend = [RealmImageModel]()
        for result in results{
            if breedNames.contains(result.breedName ?? "") {
                resultToSend.append(result)
            }
        }
        return resultToSend
    }
    
    func addData(object: RealmImageModel) {
        if !DBManager.shared.isEmpty() {
            for imageModel in DBManager.shared.getDataFromDB() {
                if object.breedName == imageModel.breedName {
                    if !(imageModel.images.contains(object.images.first ?? "")) {
                        object.images.append(objectsIn: imageModel.images)
                        writeToDB(with: object)
                    }
                } else {
                    writeToDB(with: object)
                }
            }
        } else {
            writeToDB(with: object)
        }
    }
    
    @discardableResult
    private func writeToDB(with object: RealmImageModel) -> Bool {
        do {
            try database.write {
                database.add(object, update: .all)
            }
        } catch {
            return false
        }
        return true
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
