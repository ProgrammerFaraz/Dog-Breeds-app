//
//  DogBreedsModel.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 26/10/2022.
//

import Foundation

struct DogBreedsModel: Codable {
    let data: [String: [String]]
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case data = "message"
        case status
    }
}
