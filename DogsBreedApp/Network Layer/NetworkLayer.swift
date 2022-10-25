//
//  NetworkLayer.swift
//  DogsBreedApp
//
//  Created by Faraz Ahmed Khan on 26/10/2022.
//

import Moya

enum API {
    case listAllBreeds
    case listByBreed(param: [String: Any])
}

extension API: TargetType {
    /// The target's base `URL`.
    var baseURL: URL {
        guard let url = URL(string: "https://dog.ceo/api/") else { fatalError() }
        return url
    }
    
    /// The path to be appended to `baseURL` to form the complete `URL`.
    var path: String {
        switch self {
        case .listAllBreeds:
            return "breeds/list/all"
        case .listByBreed:
            return "breed/"
        }
    }
    
    /// The HTTP method used in the request.
    var method: Method {
        switch self {
        case .listAllBreeds, .listByBreed:
            return .get
        }
    }
    
    /// Provides stub data for use in testing. Default is `Data()`.
    var sampleData: Data {
        return Data()
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        switch self {
        case .listByBreed(let params):
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .listAllBreeds:
            return .requestPlain
        }
    }
    
    /// The headers to be used in the request.
    var headers: [String : String]? {
        switch self {
        case .listAllBreeds, .listByBreed:
            return ["Content-Type": "application/json"]
        }
    }

}
