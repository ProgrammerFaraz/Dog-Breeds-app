//
//  GetAllBreedsUsecase.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

protocol GetAllBreedsUsecase {
    func fetchAllDogBreeds(method: FetchingType, completion: @escaping (DogBreedsModel?, String?) -> ())
}

class DefaultGetAllBreedsUsecase: GetAllBreedsUsecase {
    
    private var homeRepository: HomeRepository

    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }

    /// Method to fetch all dog breeds
    /// - Parameter completion: closure to be executed once all breeds are fetched from server
    func fetchAllDogBreeds(method: FetchingType = .remote, completion: @escaping (DogBreedsModel?, String?) -> ()) {
        homeRepository.fetchAllDogBreeds(from: method) { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
    
}
