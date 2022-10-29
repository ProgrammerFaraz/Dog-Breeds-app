//
//  FavouriteBreedUsecase.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

protocol FavouriteBreedUsecase {
    func markFavourite(imageURL: String, breedName: String)
}

class DefaultFavouriteBreedUsecase: FavouriteBreedUsecase {
    
    /// Method to mark breed favourite
    func markFavourite(imageURL: String, breedName: String) {
        let realmImage = RealmImageModel()
        realmImage.breedName = breedName
        realmImage.images.append(imageURL)
        DBManager.shared.addData(object: realmImage)
    }

}
