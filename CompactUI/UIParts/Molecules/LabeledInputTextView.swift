//
//  LabeledInputTextView.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

struct LabeledInputTextView: View {
    let layout: Layout
    var body: some View {
        switch layout.alignment {
            case .horizontal:
                HStack {
                    Spacer().frame(width: layout.leftMargin)
                    Text(layout.labelText)
                        .font(layout.labelLayout.textFont)
                        .foregroundColor(layout.labelLayout.textForegroundColor)
                        .background(layout.labelLayout.backgroundColor)
                    TextView(
                        text: layout.inputText,
                        layout: TextView.Layout(
                            layout: layout.textLayout
                        )
                    )
                    Spacer().frame(width: layout.rightMargin)
                }
            case .vertical:
                HStack(alignment: .top, content: {
                    Spacer().frame(width: layout.leftMargin)
                    Text(layout.labelText)
                        .font(layout.labelLayout.textFont)
                        .foregroundColor(layout.labelLayout.textForegroundColor)
                        .background(layout.labelLayout.backgroundColor)
                    Spacer()
                    Spacer().frame(width: layout.rightMargin)
                })
                HStack(alignment: .center, content: {
                    Spacer().frame(width: layout.leftMargin)
                    TextView(
                        text: layout.inputText,
                        layout: TextView.Layout(
                            layout: layout.textLayout
                        )
                    )
                    Spacer().frame(width: layout.rightMargin)
                })
        }
    }
}
extension LabeledInputTextView {

    final class Layout {

        // MARK: - Enum

        enum LabeleAlignment {
            case horizontal
            case vertical
        }

        // MARK: - Property

        let labelText: String
        let inputText: String
        let alignment: LabeleAlignment
        let leftMargin: CGFloat
        let rightMargin: CGFloat
        let labelLayout: BaseLabelLayout
        let textLayout: TextView.Layout

        // MARK: - Initializer

        init(
            labelText: String,
            inputText: String,
            alignment: LabeleAlignment = .vertical,
            leftMargin: CGFloat = LayoutDefault.leftMargin,
            rightMargin: CGFloat = LayoutDefault.rightMargin,
            labelLayout: BaseLabelLayout = BaseLabelLayout(),
            textLayout: TextView.Layout = TextView.Layout()
        ) {
            self.labelText = labelText
            self.inputText = inputText
            self.alignment = alignment
            self.leftMargin = leftMargin
            self.rightMargin = rightMargin
            self.labelLayout = labelLayout
            self.textLayout = textLayout
        }

        init(
            layout: Layout
        ) {
            self.labelText = layout.labelText
            self.inputText = layout.inputText
            self.alignment = layout.alignment
            self.leftMargin = layout.leftMargin
            self.rightMargin = layout.rightMargin
            self.labelLayout = layout.labelLayout
            self.textLayout = layout.textLayout
        }
    }

}

// MARK: - Preview
#Preview {
    LabeledInputTextView(
        layout: LabeledInputTextView.Layout(
            labelText: "Please enter account id.",
            inputText: "",
            alignment: .horizontal,
            labelLayout: BaseLabelLayout(
                textForegroundColor: .gray
            ),
            textLayout: TextView.Layout(
                placeholder: "Please enter your name."
            )
        )
    )
}
