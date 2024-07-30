//
//  URLParameterEncoder.swift
//  termeet
//
//  Created by Polina Popova on 29/07/2024.
//

import Foundation

public static URLParameterEncoder: ParameterEncoder{
    public static func encoder(urlReqest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents  = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlReqest.url= urlComponents.url
        }
        if urlReqest.value(forHTTPHeaderField: "Content-Type") == nil {
            
        }
    }
}
