//
//  BusinessFilterViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 02/01/24.
//

import Foundation

struct ServiceTypeList: Identifiable {
    let id: Int
    let title: String
}

class BusinessFilterViewModel: ObservableObject, Identifiable {
    @Published var serviceTypeListItems: [ServiceTypeList] = [
        ServiceTypeList(id: 0, title: "Select Service Type"),
        ServiceTypeList(id: 1, title: "Business Services"),
        ServiceTypeList(id: 2, title: "Utility Services"),
        ServiceTypeList(id: 3, title: "Government Services"),
        ServiceTypeList(id: 4, title: "Medical Services"),
        ServiceTypeList(id: 5, title: "Religious Services"),
        ServiceTypeList(id: 6, title: "Academics"),
        ServiceTypeList(id: 7, title: "Educational Services"),
        ServiceTypeList(id: 8, title: "Defence Services"),
        ServiceTypeList(id: 9, title: "Banking Services"),
        ServiceTypeList(id: 10, title: "Social Volunteer"),
        ServiceTypeList(id: 11, title: "Other")
    ]
    
    @Published var yrsOfExp: Int = 0
    @Published var company: String = ""
    @Published var profession: String = ""
    @Published var location: String = ""
    @Published var profileScore: Double = 70
    
    @Published var selectedServiceType: Int = 0
    
    func resetFilters() {
        yrsOfExp = 0
        company = ""
        profession = ""
        location = ""
        profileScore = 0
    }
}
