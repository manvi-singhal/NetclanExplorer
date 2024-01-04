//
//  FilterView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import SwiftUI

struct FilterView: View {
    var selectedTab: ExploreView.Tab
    @Binding var showFilter: Bool
    
    var body: some View {
        
        switch selectedTab {
        case .personal:
            PersonalFilterView(showFilter: $showFilter)
        case .business:
            BusinessFilterView(showFilter: $showFilter)
        case .merchant:
            MerchantFilterView(showFilter: $showFilter)
        }
    }
}
