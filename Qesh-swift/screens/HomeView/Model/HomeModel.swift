//
//  HomeModel.swift
//  Qesh-swift
//
//  Created by Amir Khan on 14/12/2023.
//

import Foundation

struct PostModel: Decodable {
    public var userId : Int?
    public var id : Int?
    public var title : String?
    public var completed : Bool?
}
