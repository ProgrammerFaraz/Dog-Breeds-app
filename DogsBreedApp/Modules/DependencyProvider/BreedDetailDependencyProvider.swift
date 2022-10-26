//
//  BreedDetailDependencyProvider.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

/// Dependency resolver for Breed Detail module
struct BreedDetailDependencyProvider {
    
    /// Resolved UseCases
//    static var getAllBreedUsecase: GetAllBreedsUsecase {
//        return DefaultGetAllBreedsUsecase(homeRepository: homeRepository)
//    }

    /// Resolved ViewModel
    static var viewModel: DefaultBreedDetailViewModel {
        return DefaultBreedDetailViewModel()
    }

    /// Resolved ViewController
    static var viewController: UIViewController {
        guard let vc = Storyboards.main.instantiateVC(BreedDetailViewController.self) else {
            return UIViewController()
        }
        vc.viewModel = viewModel
        return vc
    }

}
