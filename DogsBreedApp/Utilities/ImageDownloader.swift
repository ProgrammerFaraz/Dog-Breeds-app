//
//  ImageDownloader.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 28/10/2022.
//

import Foundation
import UIKit

class ImageDownloader {
    
    var onSuccess: ((UIImage?) -> Void)?
    var downloading: ((Bool) -> Void)?
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        downloading?(true)
        getData(from: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            self?.downloading?(false)
            DispatchQueue.main.async() { [weak self] in
                self?.onSuccess?(UIImage(data: data))
            }
        }
    }
}
