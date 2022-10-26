//
//  HomeRemoteDatasource.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

struct HomeRemoteDataSource {
    
    func fetchAllDogBreeds(completion: @escaping (Result<DogBreedsModel, Error>) -> ()) {
        NetworkManager.request(target: .listAllBreeds, completion: completion)
    }
}
