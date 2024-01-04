//
//  PersonalListViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import Foundation

class PersonalListViewModel: ObservableObject {
    @Published var personalListViewModels: [PersonalCardViewModel]
    
    init() {
        let userProfile1 = PersonalUserProfile(
            username: "John Doe",
            image: "",
            userType: "Student",
            location: "Howrah",
            hyperlocalDistance: 3.5,
            status: "Hi Community! Im open to new connections!",
            purposes: ["Coffee", "Business", "Hobbies", "Friendship", "Movies", "Dinning", "Dating"]
        )
        
        let userProfile2 = PersonalUserProfile(
            username: "Manvi Singhal",
            image: "",
            userType: "Student",
            location: "Howrah",
            hyperlocalDistance: 3.5,
            status: "Hi Community! Im open to new connections!",
            purposes: ["Coffee", "Business", "Hobbies", "Friendship", "Movies", "Dinning", "Dating"]
        )
        
        let personalListViewModel1 = PersonalCardViewModel(personalUserProfile: userProfile1)
        let personalListViewModel2 = PersonalCardViewModel(personalUserProfile: userProfile2)
        
        personalListViewModels = [personalListViewModel1, personalListViewModel2]
    }
}
