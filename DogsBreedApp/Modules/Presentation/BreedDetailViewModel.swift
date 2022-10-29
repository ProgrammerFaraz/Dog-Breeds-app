//
//  BreedDetailViewModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation
import UIKit

protocol BreedDetailViewModel {
    func addFavouriteImage(imageURL: String, breedName: String)
    func getBreedImage(breed: String, method: FetchingType)
}

class DefaultBreedDetailViewModel: BreedDetailViewModel {

    //MARK: - PROPERTIES
    private var getBreedImageUsecase: GetBreedImagesUsecase
    var imageURLs: [String]?
    
    //MARK: - CALLBACKS
    var onSuccess: (()->Void)?
    var onError: ((String)->Void)?
    
    //MARK: - INIT
    init(getBreedImageUsecase: GetBreedImagesUsecase) {
        self.getBreedImageUsecase = getBreedImageUsecase
    }
    
    //MARK: - METHODS
    
    func getBreedImage(breed: String, method: FetchingType) {
        getBreedImageUsecase.fetchBreedImage(breed: breed, method: method) { [weak self] response, errorMsg in
            guard let self = self else { return }
            if let errorMsg = errorMsg {
                self.onError?(errorMsg)
                return
            }
            guard let response = response else { return }
            self.imageURLs = response.data
            self.onSuccess?()
        }
    }
    
    func addFavouriteImage(imageURL: String, breedName: String) {
        let realmImage = RealmImageModel()
        realmImage.breedName = breedName
        realmImage.images.append(imageURL)
        DBManager.shared.addData(object: realmImage)
    }

}
