//
//  FavouriteBreedViewModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import Foundation

protocol FavouriteBreedViewModel {
    func getFavourites(with breedNames: [String])
    func getAllFavourites()
}

class DefaultFavouriteBreedViewModel: FavouriteBreedViewModel {
    
    
    //MARK: - PROPERTIES
    private var getAllFavouriteBreedUsecase: GetAllFavouriteBreedsUsecase
    private var getFavouriteBreedUsecase: GetFavouriteBreedUsecase
    var breedNames = [String]()
    var breedImages = [String]()

    
    //MARK: - INIT
    init(getAllFavBreedUsecase: GetAllFavouriteBreedsUsecase, getFavBreedUsecase :GetFavouriteBreedUsecase) {
        self.getAllFavouriteBreedUsecase = getAllFavBreedUsecase
        self.getFavouriteBreedUsecase = getFavBreedUsecase
    }
    
    //MARK: - METHODS
    func getFavourites(with breedNames: [String]) {
        self.breedImages.removeAll()
        let results = getFavouriteBreedUsecase.getFavouriteBreed(with: breedNames)
        for result in results {
            self.breedNames.append(result.breedName ?? "")
            self.breedImages.append(contentsOf: Array(result.images))
        }
    }

    func getAllFavourites() {
        self.breedImages.removeAll()
        let results = getAllFavouriteBreedUsecase.getAllFavouriteBreed()
        for result in results {
            self.breedNames.append(result.breedName ?? "")
            self.breedImages.append(contentsOf: Array(result.images))
        }
    }

}
