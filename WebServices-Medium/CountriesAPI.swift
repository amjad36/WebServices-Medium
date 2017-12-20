//
//  CountriesAPI.swift
//  WebServices-Medium
//
//  Created by Amjad Khan on 19/12/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import Foundation

enum CountriesAPI {
    case Name(name: String)
    case AlphaCodes(codes: [String])
}

extension CountriesAPI: Resource {
    
    // let request = CountriesAPI.Name(name: "Germany").requestWithBaseUrl(baseUrl: URL.countriesURL())
    
    var path: String {
        switch self {
        case let .Name(name):
            return "name/\(name)"
        case .AlphaCodes:
            return "alpha"
        }
    }
    
    var parameters: [String : String] {
        switch self {
        case .Name:
            return ["fullText" : "true"]
        case let .AlphaCodes(codes):
            return ["codes": codes.joined(separator: ",")]
        }
    }
    
}
