//
//  GetAllFavouriteBreedsUsecase.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

protocol GetAllFavouriteBreedsUsecase {
    func getAllFavouriteBreed() -> [RealmImageModel]
}

class DefaultGetAllFavouriteBreedsUsecase: GetAllFavouriteBreedsUsecase {
    
    private var repository: FavouriteBreedRepository

    init(repository: FavouriteBreedRepository) {
        self.repository = repository
    }

    /// Method to fetch all favourite breeds
    func getAllFavouriteBreed() -> [RealmImageModel] {
        return repository.getAllFavouriteBreeds(from: .local) ?? []
    }
}
