//
//  PersonalFilterView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import SwiftUI

struct PersonalFilterView: View {
    @ObservedObject private var viewModel = PersonalFilterViewModel()
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
                    
                    Text("Profession|University|Company").font(.headline)
                    filterRow(title: "Profession", placeholder: "Enter profession to filter", text: $viewModel.profession)
                    filterRow(title: "University", placeholder: "Enter university name to filter", text: $viewModel.university)
                    filterRow(title: "Company", placeholder: "Enter company name to filter", text: $viewModel.company)
                    Divider()
                    Text("Location").font(.headline)
                    filterRow(title: "Origin/Hometown", placeholder: "Enter city to filter", text: $viewModel.origin)
                    filterRow(title: "Lives In", placeholder: "Enter city to filter", text: $viewModel.livesIn)
                    Divider()
                    Text("Preferences").font(.headline)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                        ForEach(viewModel.genderListItems) { item in
                            Button(action: {
                                viewModel.toggleSelection(for: item)
                            }) {
                                Text(item.title)
                                    .foregroundColor(item.isSelected ? .white : .accentColor)
                                    .padding(5)
                                    .frame(width: 110, height: 50)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(item.isSelected ? Color.accentColor : Color.white)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.accentColor, lineWidth: 1)
                                    )
                            }
                        }
                    }
                    
                    filterRow(title: "Hobbies", placeholder: "Enter hobbies to filter", text: $viewModel.hobbies)
                    filterRow(title: "Movies", placeholder: "Enter movies to filter", text: $viewModel.movies)
                    filterRow(title: "Sports", placeholder: "Enter sports to filter", text: $viewModel.sports)
                    Divider()
                    Text("Profile Completion Score").font(.headline)
                    
                    SliderView(viewModel: viewModel, minValue: 1, maxValue: 100, initValue: viewModel.profileScore, unit: "")
                    
                    Divider()
                    Text("Purpose").font(.headline)
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
                .fontWeight(.regular)
            
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
    PersonalFilterView(showFilter: .constant(true))
}
