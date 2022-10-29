//
//  FavouriteBreedDependencyProvider.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

/// Dependency resolver for Favourite Breed module
struct FavouriteBreedDependencyProvider {
    
    /// Resolved Repository
    static var favouriteBreedRepository: FavouriteBreedRepository {
        return FavouriteBreedRepository()
    }
    
    /// Resolved Datasource
    static var localDatasource: FavouriteBreedLocalDatasource {
        return FavouriteBreedLocalDatasource()
    }

    /// Resolved UseCases
    static var getAllFavouriteBreedsUsecase: GetAllFavouriteBreedsUsecase {
        return DefaultGetAllFavouriteBreedsUsecase(repository: favouriteBreedRepository)
    }
    
    static var getFavouriteBreedUsecase: GetFavouriteBreedUsecase {
        return DefaultGetFavouriteBreedUsecase(repository: favouriteBreedRepository)
    }
    
    /// Resolved ViewModel
    static var viewModel: DefaultFavouriteBreedViewModel {
        return DefaultFavouriteBreedViewModel(getAllFavBreedUsecase: getAllFavouriteBreedsUsecase, getFavBreedUsecase: getFavouriteBreedUsecase)
    }

    /// Resolved ViewController
    static var viewController: FavouriteBreedViewController? {
        let vc = Storyboards.main.instantiateVC(FavouriteBreedViewController.self)
        vc?.viewModel = viewModel
        return vc
    }

}
