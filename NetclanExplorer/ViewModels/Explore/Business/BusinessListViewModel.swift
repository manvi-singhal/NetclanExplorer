//
//  BusinessListViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import Foundation

class BusinessListViewModel: ObservableObject {
    @Published var businessListViewModels: [BusinessCardViewModel]

    init() {
        let userProfile1 = BusinessUserProfile(
            username: "John Doe",
            image: "",
            userType: "Android Application Developer",
            location: "Howrah",
            hyperlocalDistance: 3.5,
            yrsOfExp: 0,
            status: "Hi Community! I'm available to your service"
        )
        
        let userProfile2 = BusinessUserProfile(
            username: "Manvi Singhal",
            image: "profile_img",
            userType: "Android Application Developer",
            location: "Howrah",
            hyperlocalDistance: 3.5,
            yrsOfExp: 0,
            status: "Hi Community! I'm available to your service"
        )
        
        let businessListViewModel1 = BusinessCardViewModel(businessUserProfile: userProfile1)
        let businessListViewModel2 = BusinessCardViewModel(businessUserProfile: userProfile2)
        
        businessListViewModels = [businessListViewModel1, businessListViewModel2]
    }
}
