//
//  GetFavouriteBreedUsecase.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

protocol GetFavouriteBreedUsecase {
    func getFavouriteBreed(with names: [String]) -> [RealmImageModel]
}

class DefaultGetFavouriteBreedUsecase: GetFavouriteBreedUsecase {
    
    private var repository: FavouriteBreedRepository

    init(repository: FavouriteBreedRepository) {
        self.repository = repository
    }

    /// Method to fetch favourite breeds
    func getFavouriteBreed(with names: [String]) -> [RealmImageModel] {
        return repository.getFavouriteBreeds(with: names, from: .local) ?? []
    }
}
