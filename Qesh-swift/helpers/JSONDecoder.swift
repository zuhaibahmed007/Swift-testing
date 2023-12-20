//
//  JSONDecoder.swift
//  Qesh-swift
//
//  Created by Amir Khan on 15/12/2023.
//

import Foundation

public func decodeModel<T: Decodable>(type: T.Type, from jsonData: Data) throws -> T {
    return try JSONDecoder().decode(type, from: jsonData)
}
