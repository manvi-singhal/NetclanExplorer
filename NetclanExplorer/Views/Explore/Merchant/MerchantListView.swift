//
//  MerchantListView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct MerchantListView: View {
    @ObservedObject var viewModel: ExploreViewModel
    var searchText: String

    var body: some View {
        List(viewModel.filteredMerchantListViewModels) { item in
            MerchantCardView(viewModel: item)
                .listRowSeparator(.hidden)
                .padding(.bottom)
        }
        .listStyle(.plain)
    }
}
