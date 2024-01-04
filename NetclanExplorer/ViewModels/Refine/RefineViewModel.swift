//
//  RefineViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import Foundation

class RefineViewModel: ObservableObject, Identifiable {
    @Published var availabilityListItems: [AvailabilityList] = [
        AvailabilityList(id: 0, title: "Availability | Hey Lets Connect"),
        AvailabilityList(id: 1, title: "Away | Stay Discreet And Watch"),
        AvailabilityList(id: 2, title: "Busy | Do Not Disturb | Will Catch Up Later"),
        AvailabilityList(id: 3, title: "SOS | Emergency! Need Assistance! HELP"),
    ]
    
    @Published var purposeListItems: [PurposeList] = [
        PurposeList(id: 1, title: "Coffee"),
        PurposeList(id: 2, title: "Business"),
        PurposeList(id: 3, title: "Hobbies"),
        PurposeList(id: 4, title: "Friendship"),
        PurposeList(id: 5, title: "Movies"),
        PurposeList(id: 6, title: "Dining"),
        PurposeList(id: 7, title: "Dating"),
        PurposeList(id: 8, title: "Movies")
    ]
    
    @Published var selectedAvailability: Int = 0
    @Published var statusText: String = "Hi Community! I'm open to new connections 😊"
    @Published var hyperlocalDistance: Double = 25.0
    
    var wordCount: Int {
        return statusText.split { !$0.isLetter }.count
    }
    
    func toggleSelection(for item: PurposeList) {
            if let index = purposeListItems.firstIndex(where: { $0.id == item.id }) {
                purposeListItems[index].isSelected.toggle()
            }
        }

        func selectedPurposeItems() -> String {
            let selectedPurposeItems = purposeListItems.filter { $0.isSelected }.map { $0.title }
            return selectedPurposeItems.joined(separator: ", ")
        }
}
