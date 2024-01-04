//
//  MerchantListViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import Foundation

class MerchantListViewModel: ObservableObject {
    @Published var merchantListViewModels: [MerchantCardViewModel]

    init() {
        let userProfile1 = MerchantUserProfile(
            username: "John Doe",
            image: "profile_img",
            userType: "Android Application Developer",
            location: "Howrah",
            hyperlocalDistance: 3.5,
            status: "Hi community! We have great deals for you. Check us out!!"
        )
        
        let userProfile2 = MerchantUserProfile(
            username: "Manvi Singhal",
            image: "",
            userType: "Android Application Developer",
            location: "Howrah",
            hyperlocalDistance: 3.5,
            status: "Hi community! We have great deals for you. Check us out!!"
        )
        
        let merchantListViewModel1 = MerchantCardViewModel(merchantUserProfile: userProfile1)
        let merchantListViewModel2 = MerchantCardViewModel(merchantUserProfile: userProfile2)
        
        merchantListViewModels = [merchantListViewModel1, merchantListViewModel2]
    }
}
