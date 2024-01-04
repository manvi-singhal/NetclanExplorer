//
//  BusinessCardView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import SwiftUI

struct BusinessCardView: View {
    @ObservedObject var viewModel: BusinessCardViewModel
    
    var body: some View {
        VStack {
            
            Button(action: {
                viewModel.invite()
            }) {
                HStack(spacing: 3) {
                    if !viewModel.isPending {
                        Image(systemName: "plus")
                            .fontWeight(.bold)
                    }
                    Text(viewModel.isPending ? "PENDING" : "INVITE")
                        .fontWeight(.bold)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .offset(y: 10)
            .padding(.vertical, 0)
            
            HStack(alignment: .top) {
                if !viewModel.businessUserProfile.image.isEmpty {
                    Image(viewModel.businessUserProfile.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.accentColor, lineWidth: 2))
                }
                else {
                    Text(viewModel.shortUsername)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 100, height: 100)
                        .background(Color.accentColor.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("")
                    Text("")
                    Text("\(viewModel.businessUserProfile.username)")
                        .fontWeight(.heavy)
                    
                    Text("\(viewModel.businessUserProfile.location) within \(String(format: "%.1f", viewModel.businessUserProfile.hyperlocalDistance)) km")
                        .foregroundStyle(Color.accentColor.opacity(0.8))
                        .font(.caption)
                        .lineLimit(1)
                    
                    HStack {
                        Image(systemName: "phone.circle.fill")
                        Image(systemName: "person.crop.circle.fill")
                    }
                    .padding(.horizontal)
                    .font(.largeTitle)
                    
                    ProgressView(value: 0.25)
                        .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                        .scaleEffect(x: 1, y: 4, anchor: .center)
                        .padding(.vertical, 8)
                }
                .padding(.leading, 5)
            }
            
            VStack(alignment: .leading) {
                Text("\(viewModel.businessUserProfile.userType) | \(viewModel.businessUserProfile.yrsOfExp) yrs of Experience ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .lineLimit(...2)
                
                Text("\(viewModel.businessUserProfile.status)")
                    .fontWeight(.regular)
                    .font(.subheadline)
                    .lineLimit(...2)
                
            }
            
        }
        .foregroundStyle(Color.accentColor.opacity(0.8))
        .padding()
        .frame(height: 250)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 5, y: 8)
    }
}
