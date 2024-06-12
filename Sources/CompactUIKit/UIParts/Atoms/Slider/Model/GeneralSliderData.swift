//
//  GeneralSliderData.swift
//
//  
//  Created by 190yamayama on 2024/06/12
//  
//

import Combine
import SwiftUI

final class GeneralSliderData: ObservableObject {

    let didChange = CurrentValueSubject<CGFloat ,Never>(0)
    let minValue: CGFloat
    let maxValue: CGFloat

    var sliderValue: CGFloat = 0 {
        willSet {
            didChange.send(newValue)
        }
    }

    // MARK: - Initializer

    public init(
        value: CGFloat,
        minValue: CGFloat = 0,
        maxValue: CGFloat = 100
    ) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.didChange.send(value)
    }

}
