//
//  CardModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import Foundation

struct PersonalUserProfile {
    var username: String
    var image: String
    var userType: String
    var location: String
    var hyperlocalDistance: Double
    var status: String
    var purposes: [String]
}

struct BusinessUserProfile {
    var username: String
    var image: String
    var userType: String
    var location: String
    var hyperlocalDistance: Double
    var yrsOfExp: Int
    var status: String
}

struct MerchantUserProfile {
    var username: String
    var image: String
    var userType: String
    var location: String
    var hyperlocalDistance: Double
    var status: String
}
