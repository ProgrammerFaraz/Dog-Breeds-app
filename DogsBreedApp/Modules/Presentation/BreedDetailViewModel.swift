//
//  BreedDetailViewModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

protocol BreedDetailViewModel {
    func markFavourite(breed: String)
}

class DefaultBreedDetailViewModel: BreedDetailViewModel {
    
    //MARK: - PROPERTIES
//    private var getAllBreedUsecase: GetAllBreedsUsecase

    //MARK: - CALLBACKS
    var onSuccess: ((DogBreedsModel)->Void)?
    var onError: ((String)->Void)?
    
    //MARK: - INIT
//    init(getAllBreedUsecase: GetAllBreedsUsecase) {
//        self.getAllBreedUsecase = getAllBreedUsecase
//    }
    
    //MARK: - METHODS
    func markFavourite(breed: String) {
        
    }

}
