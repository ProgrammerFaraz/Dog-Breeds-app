//
//  RealmImageModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import RealmSwift

class RealmImageModel: Object {
    @objc dynamic var breedName: String?
    var images = List<String>()
    
    override class func primaryKey() -> String? {
            return "breedName"
        }

}
