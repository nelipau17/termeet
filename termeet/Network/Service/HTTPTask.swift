//
//  HTTPTask.swift
//  termeet
//
//  Created by Polina Popova on 29/07/2024.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, urlParameters Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, aditionHeaders: HTTPHeaders?)
}
