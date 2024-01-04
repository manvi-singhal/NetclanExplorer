//
//  PersonalListView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct PersonalListView: View {
    @ObservedObject var viewModel: ExploreViewModel
    var searchText: String
    
    var body: some View {
        List(viewModel.filteredPersonalListViewModels) { item in
            PersonalCardView(viewModel: item)
                .listRowSeparator(.hidden)
                .padding(.bottom)
        }
        .listStyle(.plain)
        .onChange(of: searchText) { newValue in
            viewModel.searchText = newValue
        }
    }
}

