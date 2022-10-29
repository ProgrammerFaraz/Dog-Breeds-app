//
//  AppDefaults.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 29/10/2022.
//

import Foundation

class AppDefaults {
    
    public static let defaults = UserDefaults.init()
    
    /// Method to clear all UserDefaults data
    public static func clearUserDefaults(){
        let dictionary = AppDefaults.defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    /// Array of favourite breeds stored locally
//    public static var favouriteBreed: [String: [String]]? {
//        get {
//            if let breedArray = AppDefaults.defaults.array(forKey: "favouriteBreed") {
//                return breedArray
//            }
//            return nil
//        }
//        set{
//            AppDefaults.defaults.set(newValue, forKey: "favouriteBreed")
//        }
//    }
    
}
