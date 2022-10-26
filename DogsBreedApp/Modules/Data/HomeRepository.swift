//
//  HomeRepository.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

class HomeRepository {
    
    //MARK: - PROPERTIES
    private var remoteDataSource: HomeRemoteDataSource!
    
    //MARK: - INIT
    init() {
        remoteDataSource = HomeRemoteDataSource()
    }
    
    //MARK: - METHODS
    func fetchAllDogBreeds(from method: FetchingType, completion:@escaping (DogBreedsModel?, String?) -> ()) {
        switch method {
        case .remote:
            remoteDataSource.fetchAllDogBreeds { result in
                switch result {
                case .success(let response):
                    completion(response, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            }
        case .local:
            //Add loading from local DB logic here
            print("Loading from local DB here")
        }
    }
}
