//
//  BreedDetailViewController.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import UIKit

class BreedDetailViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var breedNameLabel: UILabel!
    
    var viewModel: DefaultBreedDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func configure(breedName: String, dogImage: UIImage) {
        self.dogImageView.image = dogImage
        self.breedNameLabel.text = breedName
    }
}
