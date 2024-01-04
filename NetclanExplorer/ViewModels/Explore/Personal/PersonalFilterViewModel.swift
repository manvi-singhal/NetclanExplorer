//
//  PersonalFilterViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import Foundation

struct GenderList: Identifiable {
    var id: Int
    let title: String
    var isSelected: Bool = false
}

class PersonalFilterViewModel: ObservableObject, Identifiable {
    
    @Published var genderListItems: [GenderList] = [
        GenderList(id: 1, title: "Male"),
        GenderList(id: 2, title: "Female"),
        GenderList(id: 3, title: "Transgender")
    ]
    
    @Published var profession: String = ""
    @Published var university: String = ""
    @Published var company: String = ""
    @Published var origin: String = ""
    @Published var livesIn: String = ""
    @Published var hobbies: String = ""
    @Published var movies: String = ""
    @Published var sports: String = ""
    @Published var profileScore: Double = 40
    
    func toggleSelection(for item: GenderList) {
        if let index = genderListItems.firstIndex(where: { $0.id == item.id }) {
            genderListItems[index].isSelected.toggle()
        }
    }
    
    func selectedGenderItems() -> String {
        let selectedGenderItems = genderListItems.filter { $0.isSelected }.map { $0.title }
        return selectedGenderItems.joined(separator: ", ")
    }
    
    func resetFilters() {
        for index in genderListItems.indices {
            genderListItems[index].isSelected = false
        }
        profession = ""
        university = ""
        company = ""
        origin = ""
        livesIn = ""
        hobbies = ""
        movies = ""
        sports = ""
    }
}
