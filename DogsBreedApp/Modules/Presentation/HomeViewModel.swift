//
//  HomeViewModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

protocol HomeViewModel {
    func getAllBreeds(method: FetchingType)
}

class DefaultHomeViewModel: HomeViewModel {
    
    //MARK: - PROPERTIES
    private var getAllBreedUsecase: GetAllBreedsUsecase
    var breeds = [String]()

    //MARK: - CALLBACKS
    var onSuccess: ((DogBreedsModel)->Void)?
    var onError: ((String)->Void)?
    
    //MARK: - INIT
    init(getAllBreedUsecase: GetAllBreedsUsecase) {
        self.getAllBreedUsecase = getAllBreedUsecase
    }
    
    //MARK: - METHODS
    func getAllBreeds(method: FetchingType) {
        getAllBreedUsecase.fetchAllDogBreeds(method: method) { [weak self] response, errorMsg in
            guard let self = self else { return }
            if let errorMsg = errorMsg {
                self.onError?(errorMsg)
                return
            }
            guard let response = response else { return }
            self.breeds = Array(response.data.keys)
            self.onSuccess?(response)
        }
    }

}
