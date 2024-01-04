//
//  FABiconStyle.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 01/01/24.
//

import SwiftUI

struct FABIconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.largeTitle)
            .background(Circle().fill(Color.yellow))
    }
}

extension Image {
    func fabIconStyle() -> some View {
        self.modifier(FABIconStyle())
    }
}
