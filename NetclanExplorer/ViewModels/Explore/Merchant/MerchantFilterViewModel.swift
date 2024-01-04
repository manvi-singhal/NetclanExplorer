//
//  MerchantFilterViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 02/01/24.
//

import Foundation

struct CategoryList: Identifiable {
    let id: Int
    let title: String
}

class MerchantFilterViewModel: ObservableObject, Identifiable {
    @Published var categoryListItems: [CategoryList] = [
        CategoryList(id: 0, title: "Select Category Type to filter"),
        CategoryList(id: 1, title: "Wine Shops"),
        CategoryList(id: 2, title: "Restaurants & Coffee Shops"),
        CategoryList(id: 3, title: "Shoes & Accessories"),
        CategoryList(id: 4, title: "Jewellers"),
        CategoryList(id: 5, title: "Saloons"),
        CategoryList(id: 6, title: "Gymnasium"),
        CategoryList(id: 7, title: "Chemists & Drugists"),
        CategoryList(id: 8, title: "Automobile Dealers"),
        CategoryList(id: 9, title: "Movie Theaters"),
        CategoryList(id: 10, title: "Home Appliances"),
        CategoryList(id: 11, title: "Mobile Phones Accessories"),
        CategoryList(id: 12, title: "Hospital"),
        CategoryList(id: 13, title: "Others")
    ]
    
    @Published var company: String = ""
    @Published var profileScore: Double = 70
    
    @Published var selectedCategory: Int = 0
    
    func resetFilters() {
        company = ""
        profileScore = 0
    }
}



