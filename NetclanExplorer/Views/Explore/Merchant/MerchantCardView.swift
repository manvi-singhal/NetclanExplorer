//
//  MerchantCardView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 31/12/23.
//

import SwiftUI

struct MerchantCardView: View {
    @ObservedObject var viewModel: MerchantCardViewModel
    
    var body: some View {
        VStack {
            
            HStack(alignment: .top) {
                if !viewModel.merchantUserProfile.image.isEmpty {
                    Image(viewModel.merchantUserProfile.image)
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
                    Text("\(viewModel.merchantUserProfile.username)")
                        .fontWeight(.heavy)
                    
                    Text("\(viewModel.merchantUserProfile.location) within \(String(format: "%.1f", viewModel.merchantUserProfile.hyperlocalDistance)) km")
                        .foregroundStyle(Color.accentColor.opacity(0.8))
                        .font(.subheadline)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ProgressView(value: 0.25)
                        .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                        .scaleEffect(x: 1, y: 4, anchor: .center)
                        .padding(.vertical, 8)
                    
                    HStack {
                        Image(systemName: "phone.circle.fill")
                        Image(systemName: "person.crop.circle.fill")
                        Image(systemName: "mappin.circle.fill")
                    }
                    .padding(.horizontal)
                    .font(.largeTitle)
                }
                .padding(.leading, 5)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                
                Text("\(viewModel.merchantUserProfile.status)")
                    .fontWeight(.regular)
                    .font(.subheadline)
                    .lineLimit(...2)
                    .padding(.bottom, 5)
                
                Text("\(viewModel.merchantUserProfile.userType)")
                    .fontWeight(.light)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let userProfile = MerchantUserProfile(
            username: "John Doe",
            image: "",
            userType: "Android Application Developer",
            location: "Howrah, West Bengal, India",
            hyperlocalDistance: 3.5,
            status: "Hi Community! I'm available to your service"
        )
        
        let viewModel = MerchantCardViewModel(merchantUserProfile: userProfile)
        
        return MerchantCardView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}

