//
//  ExploreViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var personalListViewModels: PersonalListViewModel
    @Published var businessListViewModels: BusinessListViewModel
    @Published var merchantListViewModels: MerchantListViewModel
    
    init() {
        personalListViewModels = PersonalListViewModel()
        businessListViewModels  = BusinessListViewModel()
        merchantListViewModels = MerchantListViewModel()
    }
    
    var filteredPersonalListViewModels: [PersonalCardViewModel] {
        if searchText.isEmpty {
            return personalListViewModels.personalListViewModels
        } else {
            return personalListViewModels.personalListViewModels.filter { viewModel in
                viewModel.username.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var filteredBusinessListViewModels: [BusinessCardViewModel] {
        if searchText.isEmpty {
            return businessListViewModels.businessListViewModels
        } else {
            return businessListViewModels.businessListViewModels.filter { viewModel in
                viewModel.username.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var filteredMerchantListViewModels: [MerchantCardViewModel] {
        if searchText.isEmpty {
            return merchantListViewModels.merchantListViewModels
        } else {
            return merchantListViewModels.merchantListViewModels.filter { viewModel in
                viewModel.username.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
