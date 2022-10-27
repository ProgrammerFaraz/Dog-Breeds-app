//
//  DogImageModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 27/10/2022.
//

import Foundation

struct DogImageModel: Codable {
    let data: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case data = "message"
        case status
    }
}
