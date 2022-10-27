//
//  BreedDetailRepository.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

class BreedDetailRepository {
    
    //MARK: - PROPERTIES
    private var remoteDataSource: BreedDetailRemoteDatasource!
    
    //MARK: - INIT
    init() {
        remoteDataSource = BreedDetailRemoteDatasource()
    }
    
    //MARK: - METHODS
    func fetchBreedImage(breed: String, from method: FetchingType, completion:@escaping (DogImageModel?, String?) -> ()) {
        switch method {
        case .remote:
            remoteDataSource.fetchBreedImage(breed: breed) { result in
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
