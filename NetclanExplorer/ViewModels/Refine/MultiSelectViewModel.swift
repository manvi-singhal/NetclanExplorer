//
//  MultiSelectViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import Foundation

protocol MultiSelectViewModel: ObservableObject {
    associatedtype Item: Identifiable
    var items: [Item] { get }
    func toggleSelection(for item: Item)
}
