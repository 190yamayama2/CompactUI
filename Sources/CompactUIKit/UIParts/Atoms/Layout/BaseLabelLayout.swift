//
//  BaseLabelLayout.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

public class BaseLabelLayout: BaseLayout {

    let textFont: Font
    let textForegroundColor: Color

    // MARK: - Initializer

    public init(
        textFont: Font = LayoutDefault.primaryFont,
        textForegroundColor: Color = LayoutDefault.primaryFontColor,
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
        layout: BaseLabelLayout
    ) {
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
