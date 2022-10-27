//
//  BreedDetailViewModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation
import UIKit

protocol BreedDetailViewModel {
    func markFavourite(breed: String)
    func getBreedImage(breed: String, method: FetchingType)
}

class DefaultBreedDetailViewModel: BreedDetailViewModel {
    
    //MARK: - PROPERTIES
    private var getBreedImageUsecase: GetBreedImagesUsecase
    private var imageDownloader = ImageDownloader()
    
    //MARK: - CALLBACKS
    var onSuccess: ((UIImage)->Void)?
    var onError: ((String)->Void)?
    
    //MARK: - INIT
    init(getBreedImageUsecase: GetBreedImagesUsecase) {
        self.getBreedImageUsecase = getBreedImageUsecase
        bindImageDownloader()
    }
    
    //MARK: - METHODS
    
    func getBreedImage(breed: String, method: FetchingType) {
        getBreedImageUsecase.fetchBreedImage(breed: breed, method: method) { [weak self] response, errorMsg in
            guard let self = self else { return }
            if let errorMsg = errorMsg {
                self.onError?(errorMsg)
                return
            }
            guard let response = response,
                  let url = URL(string: response.data ?? "") else { return }
            self.imageDownloader.downloadImage(from: url)
        }
    }
    
    func markFavourite(breed: String) {
        
    }
    
    private func bindImageDownloader() {
        self.imageDownloader.onSuccess = { [weak self] image in
            guard let image = image else { return }
            self?.onSuccess?(image)
        }
        
//        self.imageDownloader.downloading = { [weak self] isDownloading in
//
//        }
    }

}
