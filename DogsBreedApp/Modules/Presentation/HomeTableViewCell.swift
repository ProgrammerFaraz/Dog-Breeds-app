//
//  HomeTableViewCell.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let rowHeight: CGFloat = 70
    static let identifier = "HomeTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(breedName: String) {
        self.titleLabel.text = breedName
    }

}
