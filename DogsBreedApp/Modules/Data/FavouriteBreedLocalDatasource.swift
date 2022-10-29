//
//  FavouriteBreedLocalDatasource.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import RealmSwift

struct FavouriteBreedLocalDatasource {
    
    func fetchAllFavouriteBreeds() -> Results<RealmImageModel> {
        return DBManager.shared.getDataFromDB()
    }
    
    func fetchFavouriteBreeds(with names: [String]) -> [RealmImageModel] {
        DBManager.shared.getData(with: names)
    }
}
