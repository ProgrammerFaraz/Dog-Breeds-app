//
//  BreedDetailDependencyProvider.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

/// Dependency resolver for Breed Detail module
struct BreedDetailDependencyProvider {
    
    /// Resolved Repository
    static var breedDetailRepository: BreedDetailRepository {
        return BreedDetailRepository()
    }
    
    /// Resolved Datasource
    static var breedDetailRemoteDatasource: BreedDetailRemoteDatasource {
        return BreedDetailRemoteDatasource()
    }

    /// Resolved UseCases
    static var getBreedImagesUsecase: GetBreedImagesUsecase {
        return DefaultGetBreedImagesUsecase(repository: breedDetailRepository)
    }
    
    static var markFavouriteBreedUsecase: FavouriteBreedUsecase {
        return DefaultFavouriteBreedUsecase()
    }

    /// Resolved ViewModel
    static var viewModel: DefaultBreedDetailViewModel {
        return DefaultBreedDetailViewModel(getBreedImageUsecase: getBreedImagesUsecase, markFavouriteBreedUsecase: markFavouriteBreedUsecase)
    }

    /// Resolved ViewController
    static var viewController: BreedDetailViewController? {
        let vc = Storyboards.main.instantiateVC(BreedDetailViewController.self)
        vc?.viewModel = viewModel
        return vc
    }

}
