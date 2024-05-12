//
//  BaseTextLayout.swift
//  CompactUI
//
//  Created by 190yamayama on 2024/03/17.
//

import SwiftUI

public class BaseTextLayout: BaseLayout {

    // MARK: - Properties

    let textFont: Font
    let textForegroundColor: Color
    let placeholder: String
    let placeholderFont: Font
    let placeholderForegroundColor: Color

    // MARK: - Initializer

    public init(
        textFont: Font = LayoutDefault.primaryFont,
        textForegroundColor: Color = LayoutDefault.primaryFontColor,
        placeholder: String = "",
        placeholderFont: Font = LayoutDefault.secondaryFont,
        placeholderForegroundColor: Color = LayoutDefault.secondaryFontColor,
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
        self.textFont = textFont
        self.textForegroundColor = textForegroundColor
        self.placeholder = placeholder
        self.placeholderFont = placeholderFont
        self.placeholderForegroundColor = placeholderForegroundColor
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
        layout: BaseTextLayout
    ) {
        self.placeholder = layout.placeholder
        self.placeholderFont = layout.placeholderFont
        self.placeholderForegroundColor = layout.placeholderForegroundColor
        self.textFont = layout.textFont
        self.textForegroundColor = layout.textForegroundColor
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
