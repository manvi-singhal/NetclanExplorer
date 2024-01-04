//
//  BusinessCardViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import Foundation

class BusinessCardViewModel: ObservableObject, Identifiable, UserViewModel {
    @Published var businessUserProfile: BusinessUserProfile
    @Published var isPending = false

    init(businessUserProfile: BusinessUserProfile) {
        self.businessUserProfile = businessUserProfile
    }

    var username: String {
        businessUserProfile.username
    }

    var shortUsername: String {
        generateShortUsername()
    }
    
    func invite() {
        isPending = true
    }
}
