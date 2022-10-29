//
//  FavouriteBreedViewController.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

class FavouriteBreedViewController: BaseViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var viewModel: DefaultFavouriteBreedViewModel?
    private var selectedBreed = [String]()

    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllFavourites()
    }
    
    //MARK: - VIEWMODEL METHODS
    private func getAllFavourites() {
        viewModel?.getAllFavourites()
    }
}

extension FavouriteBreedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.breedImages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteBreedTableViewCell.identifier) as? FavouriteBreedTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(imageURL: viewModel?.breedImages[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FavouriteBreedTableViewCell.rowHeight
    }
}

extension FavouriteBreedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.breedNames.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreedNameCollectionViewCell.identifier, for: indexPath) as? BreedNameCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(breedName: viewModel?.breedNames[indexPath.row] ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !selectedBreed.contains(viewModel?.breedNames[indexPath.row] ?? "") {
            selectedBreed.append(viewModel?.breedNames[indexPath.row] ?? "")
        } else {
            selectedBreed = selectedBreed.filter { $0 != viewModel?.breedNames[indexPath.row] ?? "" }
        }
        viewModel?.getFavourites(with: selectedBreed)
        tableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/3, height: self.collectionView.frame.height)
    }
}
