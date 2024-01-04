//
//  BusinessListView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct BusinessListView: View {
    @ObservedObject var viewModel: ExploreViewModel
    var searchText: String

    var body: some View {
        List(viewModel.filteredBusinessListViewModels) { item in
            BusinessCardView(viewModel: item)
                .listRowSeparator(.hidden)
                .padding(.bottom)
        }
        .listStyle(.plain)
    }
}
