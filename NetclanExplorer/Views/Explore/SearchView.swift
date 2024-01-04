//
//  SearchView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @State private var showFilter = false
    var selectedTab: ExploreView.Tab
    
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.accentColor)
                    .padding(.leading, 10)
                
                TextField("Search", text: $searchText)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .textFieldStyle(PlainTextFieldStyle())
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            
            Button(action: {
                showFilter.toggle()
            }, label: {
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            })
            .popover(isPresented: $showFilter, content: {
                FilterView(selectedTab: selectedTab, showFilter: $showFilter)
            })
        }
        .padding()
    }
}
