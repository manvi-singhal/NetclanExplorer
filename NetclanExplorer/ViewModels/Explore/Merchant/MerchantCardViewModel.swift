//
//  MerchantCardViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import Foundation

class MerchantCardViewModel: ObservableObject, Identifiable, UserViewModel {
    @Published var merchantUserProfile: MerchantUserProfile

    init(merchantUserProfile: MerchantUserProfile) {
        self.merchantUserProfile = merchantUserProfile
    }

    var username: String {
        merchantUserProfile.username
    }

    var shortUsername: String {
        generateShortUsername()
    }
}
