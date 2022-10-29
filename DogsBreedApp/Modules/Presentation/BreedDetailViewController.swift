//
//  BreedDetailViewController.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

class BreedDetailViewController: BaseViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var viewModel: DefaultBreedDetailViewModel?
    var breedName = ""
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
        bindHomeViewModel()
        getImage()
    }
    
    //MARK: - SETUP
    func setupviews() {
        breedNameLabel.text = breedName
    }
    
    private func bindHomeViewModel() {
        viewModel?.onSuccess = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel?.onError = { error in
            print("onError called with \(error)")
        }
    }
    
    private func getImage() {
        viewModel?.getBreedImage(breed: breedName.lowercased(), method: .remote)
    }
    
}

extension BreedDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.imageURLs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell,
              let viewModel = viewModel else {
            return UICollectionViewCell()
        }
        cell.favouriteTapped = { [weak self] imageURL in
            viewModel.addFavouriteImage(imageURL: imageURL, breedName: self?.breedName ?? "")
        }
        cell.configureCell(with: viewModel.imageURLs?[indexPath.row] ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}
