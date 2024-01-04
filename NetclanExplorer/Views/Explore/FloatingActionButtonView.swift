//
//  FloatingActionButtonView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import SwiftUI

struct FloatingActionButtonView: View {
    @Binding var isExpanded: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isExpanded ? "multiply" : "plus")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.accentColor)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

struct ExpandedListView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("Dating").font(.title2)
                Image(systemName: "heart.fill")
                    .fabIconStyle()
            }
            HStack {
                Text("Matrimony").font(.title2)
                Image(systemName: "person.2.fill")
                    .fabIconStyle()
            }
            HStack {
                Text("Buy-Sell-Rent").font(.title2)
                Image(systemName: "bag.fill")
                    .fabIconStyle()
            }
            HStack {
                Text("Business Cards").font(.title2)
                Image(systemName: "person.text.rectangle.fill")
                    .fabIconStyle()
            }
            HStack {
                Text("Netclan Groups").font(.title2)
                Image(systemName: "number")
                    .fabIconStyle()
            }
            HStack {
                Text("Notes").font(.title2)
                Image(systemName: "pencil.and.list.clipboard")
                    .fabIconStyle()
            }
        }
        .foregroundColor(.accentColor)
        .padding(.leading)
        .offset(x: 40)
    }
}
