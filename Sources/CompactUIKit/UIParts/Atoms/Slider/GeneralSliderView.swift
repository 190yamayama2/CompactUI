//
//  GeneralSliderView.swift
//  CompactUI
//
//  Created by 190yamayama on 2024/05/13
//  
//

import Combine
import SwiftUI

public struct GeneralSliderView: View {

    // MARK: - Property

    @ObservedObject var sliderValue: GeneralSliderData

    // MARK: - Layout Property

    let layout: Layout

    // MARK: - Initializer

    public init(
        value: CGFloat,
        minValue: CGFloat = 0,
        maxValue: CGFloat = 100,
        layout: Layout = Layout()
    ) {
        self.sliderValue = GeneralSliderData(
            value: value,
            minValue: minValue,
            maxValue: maxValue
        )
        self.layout = layout
    }

    // MARK: - View

    public var body: some View {
        VStack {
            Spacer().frame(width: layout.topMargin)
            HStack {
                Spacer().frame(width: layout.leftMargin)
                if layout.hasBorder {
                    Slider(
                        value: $sliderValue.sliderValue,
                        in: sliderValue.minValue...sliderValue.maxValue
                    )
                    .tint(layout.sliderColor)
                    .padding(.leading, layout.leftMargin)
                    .padding(.trailing, layout.rightMargin)
                    .padding(.top, layout.topMargin)
                    .padding(.bottom, layout.bottomMargin)
                    .background(layout.backgroundColor)
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: layout.cornerRadius
                        )
                        .stroke(
                            layout.borderColor,
                            lineWidth: layout.borderWidth
                        )
                    )
                } else {
                    Slider(
                        value: $sliderValue.sliderValue,
                        in: sliderValue.minValue...sliderValue.maxValue
                    )
                    .tint(layout.sliderColor)
                    .padding(.leading, layout.leftMargin)
                    .padding(.trailing, layout.rightMargin)
                    .padding(.top, layout.topMargin)
                    .padding(.bottom, layout.bottomMargin)
                    .background(layout.backgroundColor)
                }
                Spacer().frame(width: layout.rightMargin)
            }
            Spacer().frame(width: layout.bottomMargin)
        }
    }

}

// MARK: - Layout
extension GeneralSliderView {
    final public class Layout: BaseLayout {

        let sliderColor: Color
        let leadingPadding: CGFloat
        let trailingPadding: CGFloat
        let topPadding: CGFloat
        let bottomPadding: CGFloat

        // MARK: - Initializer

        public init(
            sliderColor: Color = LayoutDefault.sliderColor,
            leadingPadding: CGFloat = LayoutDefault.leadingPadding,
            trailingPadding: CGFloat = LayoutDefault.trailingPadding,
            topPadding: CGFloat = LayoutDefault.topPadding,
            bottomPadding: CGFloat = LayoutDefault.bottomPadding,
            topMargin: CGFloat = LayoutDefault.topMargin,
            leftMargin: CGFloat = LayoutDefault.leftMargin,
            rightMargin: CGFloat = LayoutDefault.rightMargin,
            bottomMargin: CGFloat = LayoutDefault.bottomMargin,
            backgroundColor: Color = LayoutDefault.backgroundColor,
            hasBorder: Bool = true,
            borderColor: Color = LayoutDefault.borderColor,
            borderWidth: CGFloat = LayoutDefault.borderWidth,
            cornerRadius: CGFloat = LayoutDefault.cornerRadius
        ) {
            self.sliderColor = sliderColor
            self.leadingPadding = leadingPadding
            self.trailingPadding = trailingPadding
            self.topPadding = topPadding
            self.bottomPadding = bottomPadding
            super.init(
                topMargin: topMargin,
                leftMargin: leftMargin,
                rightMargin: rightMargin,
                bottomMargin: bottomMargin,
                backgroundColor: backgroundColor,
                hasBorder: hasBorder,
                borderColor: borderColor,
                borderWidth: borderWidth,
                cornerRadius: cornerRadius
            )
        }

        public init(
            layout: Layout
        ) {
            self.sliderColor = layout.sliderColor
            self.leadingPadding = layout.leadingPadding
            self.trailingPadding = layout.trailingPadding
            self.topPadding = layout.topPadding
            self.bottomPadding = layout.bottomPadding
            super.init(
                topMargin: layout.topMargin,
                leftMargin: layout.leftMargin,
                rightMargin: layout.rightMargin,
                bottomMargin: layout.bottomMargin,
                backgroundColor: layout.backgroundColor,
                hasBorder: layout.hasBorder,
                borderColor: layout.borderColor,
                borderWidth: layout.borderWidth,
                cornerRadius: layout.cornerRadius
            )
        }

    }

}

// MARK: - Preview
#Preview {
#if os(iOS)
    VStack {
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: GeneralSliderView.Layout(
                sliderColor: .green,
                hasBorder: false
            )
        )
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: GeneralSliderView.Layout(
                sliderColor: .green,
                backgroundColor: .purple,
                hasBorder: true,
                borderColor: .blue,
                borderWidth: 3.0,
                cornerRadius: 0
            )
        )
    }
#else
    VStack {
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: GeneralSliderView.Layout(
                sliderColor: .green,
                backgroundColor: .gray,
                hasBorder: false
            )
        )
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: GeneralSliderView.Layout(
                sliderColor: .green,
                backgroundColor: .gray,
                hasBorder: true,
                borderColor: .blue,
                borderWidth: 3.0,
                cornerRadius: 0
            )
        )
    }
#endif
}
