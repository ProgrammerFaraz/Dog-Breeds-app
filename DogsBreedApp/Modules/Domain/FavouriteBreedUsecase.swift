//
//  FavouriteBreedUsecase.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

protocol FavouriteBreedUsecase {
    func markFavourite(breed: String)
}

//class DefaultFavouriteBreedUsecase: FavouriteBreedUsecase {
//    
//    /// Method to mark breed favourite
//    /// - Parameter completion: closure to be executed once all breeds are fetched from server
//    func fetchAllDogBreeds(method: FetchingType = .remote, completion: @escaping (DogBreedsModel?, String?) -> ()) {
//        u
//    }
//
//}
