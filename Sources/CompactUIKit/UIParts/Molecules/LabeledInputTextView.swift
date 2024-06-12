//
//  LabeledInputTextView.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

public struct LabeledInputTextView: View {
    let layout: Layout
    var onSubmitText: ((String) -> Void)

    public init(
        layout: Layout,
        onSubmitText: @escaping ((String) -> Void)
    ) {
        self.layout = layout
        self.onSubmitText = onSubmitText
    }

    public var body: some View {
        switch layout.alignment {
            case .horizontal:
                HStack {
                    Spacer().frame(width: layout.leftMargin)
                    Text(layout.labelText)
                        .font(layout.labelLayout.textFont)
                        .foregroundColor(layout.labelLayout.textForegroundColor)
                        .background(layout.labelLayout.backgroundColor)
                    GeneralTextView(
                        text: layout.inputText,
                        layout: GeneralTextView.Layout(
                            layout: layout.textLayout
                        ),
                        onSubmitText: { value  in
                            onSubmitText(value)
                        }
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
                    GeneralTextView(
                        text: layout.inputText,
                        layout: GeneralTextView.Layout(
                            layout: layout.textLayout
                        ),
                        onSubmitText: { value  in
                            onSubmitText(value)
                        }
                    )
                    Spacer().frame(width: layout.rightMargin)
                })
        }
    }
}
extension LabeledInputTextView {

    final public class Layout {

        // MARK: - Enum

        public enum LabeleAlignment {
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
        let textLayout: GeneralTextView.Layout

        // MARK: - Initializer

        public init(
            labelText: String,
            inputText: String,
            alignment: LabeleAlignment = .vertical,
            leftMargin: CGFloat = LayoutDefault.leftMargin,
            rightMargin: CGFloat = LayoutDefault.rightMargin,
            labelLayout: BaseLabelLayout = BaseLabelLayout(),
            textLayout: GeneralTextView.Layout = GeneralTextView.Layout()
        ) {
            self.labelText = labelText
            self.inputText = inputText
            self.alignment = alignment
            self.leftMargin = leftMargin
            self.rightMargin = rightMargin
            self.labelLayout = labelLayout
            self.textLayout = textLayout
        }

        public init(
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
#if os(iOS)
    VStack {
        LabeledInputTextView(
            layout: LabeledInputTextView.Layout(
                labelText: "Please enter account id.",
                inputText: "",
                alignment: .horizontal,
                labelLayout: BaseLabelLayout(
                    textForegroundColor: .gray
                ),
                textLayout: GeneralTextView.Layout(
                    placeholder: "Please enter your name."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        LabeledInputTextView(
            layout: LabeledInputTextView.Layout(
                labelText: "Please enter account id.",
                inputText: "",
                alignment: .vertical,
                labelLayout: BaseLabelLayout(
                    textForegroundColor: .gray
                ),
                textLayout: GeneralTextView.Layout(
                    placeholder: "Please enter your name."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#else
    VStack {
        LabeledInputTextView(
            layout: LabeledInputTextView.Layout(
                labelText: "Please enter account id.",
                inputText: "",
                alignment: .horizontal,
                labelLayout: BaseLabelLayout(
                    textForegroundColor: .gray
                ),
                textLayout: GeneralTextView.Layout(
                    placeholder: "Please enter your name."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        LabeledInputTextView(
            layout: LabeledInputTextView.Layout(
                labelText: "Please enter account id.",
                inputText: "",
                alignment: .vertical,
                labelLayout: BaseLabelLayout(
                    textForegroundColor: .gray
                ),
                textLayout: GeneralTextView.Layout(
                    placeholder: "Please enter your name."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#endif
}
