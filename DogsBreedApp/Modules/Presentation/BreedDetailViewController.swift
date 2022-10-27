//
//  BreedDetailViewController.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

class BreedDetailViewController: BaseViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - PROPERTIES
    var viewModel: DefaultBreedDetailViewModel?
    var breedName = ""
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
        bindHomeViewModel()
        getImage()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - SETUP
    func setupviews() {
        self.breedNameLabel.text = breedName
    }
    
    private func bindHomeViewModel() {
        viewModel?.onSuccess = { [weak self] image in
            self?.dogImageView.image = image
            self?.activityIndicator.stopAnimating()
        }
        viewModel?.onError = { error in
            print("onError called with \(error)")
        }
    }
    
    private func getImage() {
        activityIndicator.startAnimating()
        viewModel?.getBreedImage(breed: breedName, method: .remote)
    }

}
