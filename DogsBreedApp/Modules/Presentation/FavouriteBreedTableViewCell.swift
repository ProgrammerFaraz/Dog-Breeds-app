//
//  FavouriteBreedTableViewCell.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

class FavouriteBreedTableViewCell: UITableViewCell {

    static let identifier = "FavouriteBreedTableViewCell"
    static let rowHeight: CGFloat = 260

    //MARK: - OUTLETS
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - PROPERTIES
    private var imageDownloader = ImageDownloader()
    private var imageURL = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - SETUP
    func configure(imageURL: String) {
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

}
