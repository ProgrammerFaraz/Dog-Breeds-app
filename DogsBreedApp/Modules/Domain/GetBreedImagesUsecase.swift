//
//  GetBreedImagesUsecase.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

protocol GetBreedImagesUsecase {
    func fetchBreedImage(breed: String, method: FetchingType, completion: @escaping (DogImageModel?, String?) -> ())
}

class DefaultGetBreedImagesUsecase: GetBreedImagesUsecase {
    
    private var repository: BreedDetailRepository

    init(repository: BreedDetailRepository) {
        self.repository = repository
    }

    /// Method to fetch breed image
    /// - Parameter completion: closure to be executed once response is fetched from server
    func fetchBreedImage(breed: String, method: FetchingType, completion: @escaping (DogImageModel?, String?) -> ()) {
        repository.fetchBreedImage(breed: breed, from: method) { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
    
}
