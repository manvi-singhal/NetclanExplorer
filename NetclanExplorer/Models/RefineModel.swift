//
//  RefineModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import Foundation

struct AvailabilityList: Identifiable {
    let id: Int
    let title: String
}

struct PurposeList: Identifiable {
    let id: Int
    let title: String
    var isSelected: Bool = false
}
