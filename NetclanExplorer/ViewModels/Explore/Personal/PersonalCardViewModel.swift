//
//  PersonalCardViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import Foundation

class PersonalCardViewModel: ObservableObject, Identifiable, UserViewModel {
    @Published var personalUserProfile: PersonalUserProfile
    @Published var isPending = false
    
    init(personalUserProfile: PersonalUserProfile) {
        self.personalUserProfile = personalUserProfile
    }
    
    var username: String {
        personalUserProfile.username
    }
    
    var shortUsername: String {
        generateShortUsername()
    }
    
    func invite() {
        isPending = true
    }
}
