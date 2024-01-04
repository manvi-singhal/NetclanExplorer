//
//  MerchantFilterView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import SwiftUI

struct MerchantFilterView: View {
    @ObservedObject private var viewModel = MerchantFilterViewModel()
    @Binding var showFilter: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.accentColor)
                .frame(height: 50)
                .overlay(
                    HStack {
                        Button(action: {
                            showFilter = false
                        }) {
                            Image(systemName: "multiply")
                                .font(.title2)
                        }
                        Text("Filters")
                            .font(.title3)
                        Spacer()
                        Button(action: {
                            viewModel.resetFilters()
                        }) {
                            Text("CLEAR")
                            
                        }
                    }
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                )
        }
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    
                    
                    filterRow(title: "Company Name", placeholder: "Enter company name to filter", text: $viewModel.company)
                    
                    Divider()
                    
                    Text("Category").font(.headline)
                    Picker("Select an option", selection: $viewModel.selectedCategory) {
                        ForEach(viewModel.categoryListItems) { item in
                            Text(item.title)
                                .tag(item.id)
                                .foregroundColor(.accentColor)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
                    
                    Divider()
                    
                    Text("Profile Completion Score").font(.headline)
                    SliderView(viewModel: viewModel, minValue: 0, maxValue: 100, initValue: viewModel.profileScore, unit: "")
                    
                    Spacer()
                }
                .foregroundStyle(Color.accentColor)
                .padding()
                
                Button(action: {}, label: {
                    Text("Apply")
                        .font(.headline)
                        .frame(width: 200)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.accentColor)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.accentColor, lineWidth: 1)
                        )
                })
                .padding()
                
            }
            
        }
    }
    
    private func filterRow (title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            
            TextField(placeholder, text: text)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary, lineWidth: 1)
                )
            
        }
        .foregroundStyle(Color.accentColor)
    }
    
}

#Preview {
    MerchantFilterView(showFilter: .constant(true))
}
