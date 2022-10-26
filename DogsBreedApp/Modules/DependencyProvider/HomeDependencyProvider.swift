//
//  HomeDependencyProvider.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

/// Dependency resolver for Home module
struct HomeDependencyProvider {
    
    /// Resolved Repository
    static var homeRepository: HomeRepository {
        return HomeRepository()
    }
    
    /// Resolved Datasource
    static var homeRemoteDatasource: HomeRemoteDataSource {
        return HomeRemoteDataSource()
    }

    /// Resolved UseCases
    static var getAllBreedUsecase: GetAllBreedsUsecase {
        return DefaultGetAllBreedsUsecase(homeRepository: homeRepository)
    }

    /// Resolved ViewModel
    static var viewModel: DefaultHomeViewModel {
        return DefaultHomeViewModel(getAllBreedUsecase: getAllBreedUsecase)
    }

    /// Resolved ViewController
    static var viewController: UIViewController {
        guard let vc = Storyboards.main.instantiateVC(HomeViewController.self) else {
            return UIViewController()
        }
        vc.viewModel = viewModel
        return vc
    }
    
    /// Resolved NavigationController
    static var navigationController: HomeNavigationViewController? {
        let vc = Storyboards.main.instantiateVC(HomeNavigationViewController.self)
        vc?.viewControllers = [self.viewController]
        return vc
    }

}
