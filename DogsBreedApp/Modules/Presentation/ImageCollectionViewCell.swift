//
//  ImageCollectionViewCell.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    //MARK: - OUTLETS
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - PROPERTIES
    private var imageDownloader = ImageDownloader()
    private var imageURL = ""
        
    //MARK: - CALLBACKS
    var favouriteTapped: ((String)->(Void))?

    //MARK: - SETUP
    func configureCell(with imageURL: String) {
        activityIndicator.startAnimating()
        self.imageURL = imageURL
        guard let url = URL(string: imageURL)
        else {
            self.dogImageView.image = UIImage(named: "placeholder_image")
            return
        }
        bindImageDownloader()
        imageDownloader.downloadImage(from: url)
    }
    
    //MARK: - BINDING
    private func bindImageDownloader() {
        self.imageDownloader.onSuccess = { [weak self] image in
            self?.activityIndicator.stopAnimating()
            guard let image = image else {
                self?.dogImageView.image = UIImage(named: "placeholder_image")
                return }
            self?.dogImageView.image = image
        }
    }
    
    //MARK: - ACTIONS
    @IBAction func favouriteTapped(_ sender: UIButton) {
        favouriteTapped?(imageURL)
    }

}
