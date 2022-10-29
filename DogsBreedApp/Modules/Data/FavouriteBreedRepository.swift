//
//  FavouriteBreedRepository.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import Foundation

class FavouriteBreedRepository {
    
    //MARK: - PROPERTIES
    private var localDataSource: FavouriteBreedLocalDatasource!
    
    //MARK: - INIT
    init() {
        localDataSource = FavouriteBreedLocalDatasource()
    }
    
    //MARK: - METHODS
    func getAllFavouriteBreeds(from method: FetchingType) -> [RealmImageModel]? {
        switch method {
        case .local:
            return Array(localDataSource.fetchAllFavouriteBreeds())
        default: break
        }
        return nil
    }
    
    func getFavouriteBreeds(with names: [String], from method: FetchingType) -> [RealmImageModel]? {
        switch method {
        case .local:
            return localDataSource.fetchFavouriteBreeds(with: names)
        default: break
        }
        return nil
    }
}
