//
//  RefineView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct RefineView: View {
    @StateObject private var viewModel = RefineViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    Text("Select Your Availability")
                        .SectionTextStyle()
                        .padding(.top, 30)
                    
                    Picker("Select an option", selection: $viewModel.selectedAvailability) {
                        ForEach(viewModel.availabilityListItems) { item in
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
                    
                    Text("Add Your Status")
                        .SectionTextStyle()
                    
                    TextField("", text: $viewModel.statusText, axis: .vertical)
                        .lineLimit(4...4)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.accentColor, lineWidth: 1)
                        )
                    
                    Text("\(viewModel.wordCount)/250")
                        .font(.subheadline)
                        .foregroundColor(Color.accentColor)
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("Select Hyperlocal Distance")
                        .SectionTextStyle()
                    
                    SliderView(viewModel: viewModel, minValue: 1, maxValue: 50, initValue: viewModel.hyperlocalDistance, unit: "units")
                    
                    Text("Select Purpose")
                        .SectionTextStyle()
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                        ForEach(viewModel.purposeListItems) { item in
                            Button(action: {
                                viewModel.toggleSelection(for: item)
                            }) {
                                Text(item.title)
                                    .foregroundColor(item.isSelected ? .white : .accentColor)
                                    .padding(8)
                                    .frame(width: 100, height: 50)
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
                    
                    Button(action: {
                        print("\(viewModel.selectedPurposeItems())")
                    }, label: {
                        Text("Save and Explore")
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
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack
                    {
                        Button(action: {}){
                            NavigationLink(destination: ExploreView().toolbar(.hidden)){
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(Color.white)
                                Text("Refine")
                                    .font(.headline)
                                    .foregroundStyle(Color.white)
                            }
                        }
                    }
                }
            }
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    RefineView()
}
