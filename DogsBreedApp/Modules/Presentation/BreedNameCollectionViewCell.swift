//
//  BreedNameCollectionViewCell.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import UIKit

class BreedNameCollectionViewCell: UICollectionViewCell {
    static let identifier = "BreedNameCollectionViewCell"
    
    @IBOutlet weak var breedName: UILabel!
    
    func configure(breedName: String) {
        self.breedName.text = breedName
    }
}
