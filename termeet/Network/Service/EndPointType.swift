//
//  EndPointType.swift
//  termeet
//
//  Created by Polina Popova on 29/07/2024.
//
import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
