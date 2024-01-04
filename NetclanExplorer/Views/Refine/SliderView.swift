//
//  SliderView.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import SwiftUI

struct SliderView<ViewModel: ObservableObject>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var initValue: Double
    var minValue: Double = 1
    var maxValue: Double = 50
    var unit: String = ""
    
    init(viewModel: ViewModel, minValue: Double, maxValue: Double, initValue: Double, unit: String) {
        self.viewModel = viewModel
        self._initValue = State(initialValue: initValue)
        self.minValue = minValue
        self.maxValue = maxValue
        self.unit = unit
    }
    
    func resetSlider() {
        initValue = 0
    }
    
    var body: some View {
        VStack {
            Slider(value: $initValue, in: minValue...maxValue, step: 5.0)
                .alignmentGuide(VerticalAlignment.center) { $0[VerticalAlignment.center]}
                .padding(.top)
                .overlay(GeometryReader { gp in
                    VStack {
                        Text("\(initValue, specifier: "%.f")")
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                            .offset(x: 15, y: -5)
                            .alignmentGuide(HorizontalAlignment.leading) {
                                return $0[HorizontalAlignment.leading] - (gp.size.width - $0.width) * (initValue - minValue) / (maxValue - minValue)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }, alignment: .top)
            
            HStack{
                Text("\(minValue, specifier: "%.f") \(unit)")
                    .font(.subheadline)
                    .foregroundColor(Color.accentColor)
                Spacer()
                Text("\(maxValue, specifier: "%.f") \(unit)")
                    .font(.subheadline)
                    .foregroundColor(Color.accentColor)
                
            }
        }
    }
}
