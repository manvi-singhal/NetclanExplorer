//
//  ExploreView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct ExploreView: View {
    
    enum Tab {
        case personal, business, merchant
    }
    
    @StateObject private var exploreViewModel = ExploreViewModel()
    @State private var selectedTab: Tab = .personal
    @State private var isFABExpanded = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    tabButton(tab: .personal, text: "Personal")
                    Spacer()
                    tabButton(tab: .business,  text: "Business")
                    Spacer()
                    tabButton(tab: .merchant, text: "Merchant")
                    Spacer()
                }
                .padding()
                .background(Color(red: 29/255, green: 70/255, blue: 100/255))
                
                SearchView(searchText: $exploreViewModel.searchText, selectedTab: selectedTab)
                    .padding(.horizontal)
                
                switch selectedTab {
                case .personal:
                    PersonalListView(viewModel: exploreViewModel, searchText: exploreViewModel.searchText)
                case .business:
                    BusinessListView(viewModel: exploreViewModel, searchText: exploreViewModel.searchText)
                case .merchant:
                    MerchantListView(viewModel: exploreViewModel, searchText: exploreViewModel.searchText)
                }
            }
            .overlay {
                if isFABExpanded {
                    Color.white.opacity(0.9)
                    ExpandedListView()
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingActionButtonView(isExpanded: $isFABExpanded) {
                            isFABExpanded.toggle()
                        }
                        .padding(20)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        
                        Button(action: {}) {
                            Image(systemName: "line.3.horizontal.decrease")
                                .foregroundStyle(Color.white)
                                .padding(.top)
                        }
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text("Howdy Manvi Singhal")
                                .padding(.top)
                            HStack{
                                Image(systemName: "mappin")
                                Text("Howrah")
                            }
                        }
                        .padding(.trailing, 120)
                        .font(.caption)
                        .foregroundStyle(Color.white)
                        
                        Button(action: {}) {
                            NavigationLink(destination: RefineView().toolbar(.hidden)){
                                VStack(alignment: .trailing) {
                                    Image(systemName: "checklist")
                                        .foregroundStyle(Color.white)
                                    Text("Refine")
                                        .font(.caption)
                                        .foregroundStyle(Color.white)
                                }
                                .padding(.top)
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func tabButton(tab: Tab, text: String) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack {
                Text(text)
                    .font(.headline)
                    .foregroundColor(selectedTab == tab ? .white : Color(.systemGray3))
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(selectedTab == tab ? .white : .clear)
            }
        }
    }
}


#Preview {
    ExploreView()
}
