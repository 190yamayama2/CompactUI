//
//  LabeledInputPasswordView.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

public struct LabeledInputPasswordView: View {

    // MARK: - Layout Property

    let layout: Layout
    var onSubmitText: ((String) -> Void)

    public init(
        layout: Layout,
        onSubmitText: @escaping (String) -> Void
    ) {
        self.layout = layout
        self.onSubmitText = onSubmitText
    }

    // MARK: - View

    public var body: some View {
        switch layout.alignment {
            case .horizontal:
                HStack {
                    Spacer().frame(width: layout.leftMargin)
                    Text(layout.labelText)
                        .font(layout.labelLayout.textFont)
                        .foregroundColor(layout.labelLayout.textForegroundColor)
                        .background(layout.labelLayout.backgroundColor)
                    PasswordTextView(
                        secureText: layout.passwordText,
                        layout: PasswordTextView.Layout(
                            layout: layout.passwordLayout
                        ), 
                        onSubmitText: { value in
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
                    PasswordTextView(
                        secureText: layout.passwordText,
                        layout: PasswordTextView.Layout(
                            layout: layout.passwordLayout
                        ),
                        onSubmitText: { value in
                            onSubmitText(value)
                        }
                    )
                    Spacer().frame(width: layout.rightMargin)
                })
        }
    }
}

// MARK: - Layout
extension LabeledInputPasswordView {

    final public class Layout {

        // MARK: - Enum

        public enum LabeleAlignment {
            case horizontal
            case vertical
        }

        // MARK: - Properties

        let labelText: String
        let passwordText: String
        let alignment: LabeleAlignment
        let leftMargin: CGFloat
        let rightMargin: CGFloat
        let labelLayout: BaseLabelLayout
        let passwordLayout: PasswordTextView.Layout

        // MARK: - Initializer

        public init(
            labelText: String,
            passwordText: String,
            alignment: LabeleAlignment = .vertical,
            leftMargin: CGFloat = LayoutDefault.leftMargin,
            rightMargin: CGFloat = LayoutDefault.rightMargin,
            labelLayout: BaseLabelLayout = BaseLabelLayout(),
            passwordLayout: PasswordTextView.Layout = PasswordTextView.Layout()
        ) {
            self.labelText = labelText
            self.passwordText = passwordText
            self.alignment = alignment
            self.leftMargin = leftMargin
            self.rightMargin = rightMargin
            self.labelLayout = labelLayout
            self.passwordLayout = passwordLayout
        }

        public init(
            layout: Layout
        ) {
            self.labelText = layout.labelText
            self.passwordText = layout.passwordText
            self.alignment = layout.alignment
            self.leftMargin = layout.leftMargin
            self.rightMargin = layout.rightMargin
            self.labelLayout = layout.labelLayout
            self.passwordLayout = layout.passwordLayout
        }

    }

}

// MARK: - Preview
#Preview {
#if os(iOS)
    VStack {
        LabeledInputPasswordView(
            layout: LabeledInputPasswordView.Layout(
                labelText: "Please enter password.",
                passwordText: "",
                alignment: .horizontal,
                labelLayout: BaseLabelLayout(textForegroundColor: .gray),
                passwordLayout: PasswordTextView.Layout(
                    placeholder: "8 to 16 half-width alphanumeric characters."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        LabeledInputPasswordView(
            layout: LabeledInputPasswordView.Layout(
                labelText: "Please enter password.",
                passwordText: "",
                alignment: .vertical,
                labelLayout: BaseLabelLayout(textForegroundColor: .gray),
                passwordLayout: PasswordTextView.Layout(
                    placeholder: "8 to 16 half-width alphanumeric characters."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#else
    VStack {
        LabeledInputPasswordView(
            layout: LabeledInputPasswordView.Layout(
                labelText: "Please enter password.",
                passwordText: "",
                alignment: .horizontal,
                labelLayout: BaseLabelLayout(textForegroundColor: .gray),
                passwordLayout: PasswordTextView.Layout(
                    placeholder: "8 to 16 half-width alphanumeric characters."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        LabeledInputPasswordView(
            layout: LabeledInputPasswordView.Layout(
                labelText: "Please enter password.",
                passwordText: "",
                alignment: .vertical,
                labelLayout: BaseLabelLayout(textForegroundColor: .gray),
                passwordLayout: PasswordTextView.Layout(
                    placeholder: "8 to 16 half-width alphanumeric characters."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#endif
}
