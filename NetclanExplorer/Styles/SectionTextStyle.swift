//
//  SectionTextStyle.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct SectionTextstyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 32/255, green: 60/255, blue: 86/255))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
    }
}

extension Text {
    func SectionTextStyle() -> some View {
        self.modifier(SectionTextstyle())
    }
}
