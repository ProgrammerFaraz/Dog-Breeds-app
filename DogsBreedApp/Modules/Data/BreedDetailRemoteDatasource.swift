//
//  BreedDetailRemoteDatasource.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

struct BreedDetailRemoteDatasource {
    
    func fetchBreedImage(breed: String, completion: @escaping (Result<DogImageModel, Error>) -> ()) {
        NetworkManager.request(target: .breedImage(params: breed), completion: completion)
    }
}
