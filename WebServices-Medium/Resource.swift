//
//  Resource.swift
//  WebServices-Medium
//
//  Created by Amjad Khan on 19/12/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import Foundation

enum Method: String {
    case GET = "GET"
}

protocol Resource {
    var method: Method { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

extension Resource {
    
    var method: Method {
        return .GET
    }
    
    func requestWithBaseUrl(baseUrl: URL) -> URLRequest {
        
        let url = baseUrl.appendingPathComponent(path)
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components from \(url)")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
            
        guard let finalUrl = components.url else {
            fatalError("Unable to retrieve final url")
        }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        
        return request
    }
    
}
