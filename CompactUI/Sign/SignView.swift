//
//  SignView.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/30
//  
//

import SwiftUI

struct SignView: View {

    // MARK: - Enum

    enum Mode {
        case signIn
        case signUp
    }

    // MARK: - Properties

    @State var mode: Mode
    let layout: Layout

    // MARK: - View

    var body: some View {
        switch mode {
            case .signIn:
                singIn
            case .signUp:
                singUp
        }
    }

    private var singIn: some View {
        VStack(alignment: .center, spacing: 8, content: {
            Spacer()
            Text(layout.signInLayout.titleText)
                .font(layout.signInLayout.titleFont)
            Spacer().frame(height: layout.signInLayout.titleSubTitleSpacerSize)
            Text(layout.signInLayout.subTitleText)
                .font(layout.signInLayout.subTitleFont)
            Spacer(minLength: layout.signInLayout.spacerSize)
            LabeledInputTextView(
                layout: layout.signInLayout.accountIdFieldLayout
            )
            LabeledInputPasswordView(
                layout: layout.signInLayout.passwordFieldLayout
            )
            Spacer().frame(height: layout.signInLayout.spacerSize)
            GeneralButton(
                layout: layout.signInLayout.signInButtonLayout,
                tapAction: {

                }
            )
            GeneralButton(
                layout: layout.signInLayout.signUpButtonLayout,
                tapAction: {
                    mode = .signUp
                }
            )
            Spacer()
        })
    }

    private var singUp: some View {
        VStack(alignment: .center, spacing: 8, content: {
            Spacer()
            Text(layout.signUpLayout.titleText)
                .font(layout.signUpLayout.titleFont)
            Spacer(minLength: layout.signUpLayout.spacerSize)
            LabeledInputTextView(
                layout: layout.signUpLayout.accountIdFieldLayout
            )
            LabeledInputPasswordView(
                layout: layout.signUpLayout.firstPasswordFieldLayout
            )
            LabeledInputPasswordView(
                layout: layout.signUpLayout.secondPasswordFieldLayout
            )
            LabeledSegmentPickerView(
                selectedKey: "",
                labelText: "Gender",
                items: [
                    (key: "m", value: "male"),
                    (key: "w", value: "woman"),
                    (key: "o", value: "other"),
                ],
                pickerViewStyle: .segmented,
                layout: LabeledSegmentPickerView.Layout(
                    titleTextColor: .black,
                    titleAlignment: .leading,
                    segmentSelectedTextColor: .black,
                    segmentBackgroundColor: .white,
                    backgroundColor: .clear
                )
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            GeneralButton(
                layout: layout.signUpLayout.signUpButtonLayout,
                tapAction: {

                }
            )
            GeneralButton(
                layout: layout.signUpLayout.signInButtonLayout,
                tapAction: {
                    mode = .signIn
                }
            )
            Spacer()
        })
    }
}

// MARK: - Layout
extension SignView {

    struct Layout {

        // MARK: - Properties

        let signInLayout: SignInLayout
        let signUpLayout: SignUpLayout

        // MARK: - Initializer

        init(
            signInLayout: SignInLayout,
            signUpLayout: SignUpLayout
        ) {
            self.signInLayout = signInLayout
            self.signUpLayout = signUpLayout
        }

    }

    struct SignInLayout {

        // MARK: - Properties

        let titleText: String
        let titleFont: Font
        let subTitleText: String
        let subTitleFont: Font
        let titleSubTitleSpacerSize: CGFloat
        let spacerSize: CGFloat
        let accountIdFieldLayout: LabeledInputTextView.Layout
        let passwordFieldLayout: LabeledInputPasswordView.Layout
        let signInButtonLayout: GeneralButton.Layout
        let signUpButtonLayout: GeneralButton.Layout

        // MARK: - Initializer

        init(
            titleText: String,
            titleFont: Font = .title,
            subTitleText: String = "",
            subTitleFont: Font = .title2,
            titleSubTitleSpacerSize: CGFloat = 5.0,
            spacerSize: CGFloat = 10.0,
            accountIdFieldLayout: LabeledInputTextView.Layout,
            passwordFieldLayout: LabeledInputPasswordView.Layout,
            signInButtonLayout: GeneralButton.Layout,
            signUpButtonLayout: GeneralButton.Layout
        ) {
            self.titleText = titleText
            self.titleFont = titleFont
            self.subTitleText = subTitleText
            self.subTitleFont = subTitleFont
            self.titleSubTitleSpacerSize = titleSubTitleSpacerSize
            self.spacerSize = spacerSize
            self.accountIdFieldLayout = accountIdFieldLayout
            self.passwordFieldLayout = passwordFieldLayout
            self.signInButtonLayout = signInButtonLayout
            self.signUpButtonLayout = signUpButtonLayout
        }

    }

    struct SignUpLayout {

        // MARK: - Property

        let titleText: String
        let titleFont: Font
        let subTitleText: String
        let subTitleFont: Font
        let titleSubTitleSpacerSize: CGFloat
        let spacerSize: CGFloat
        let accountIdFieldLayout: LabeledInputTextView.Layout
        let firstPasswordFieldLayout: LabeledInputPasswordView.Layout
        let secondPasswordFieldLayout: LabeledInputPasswordView.Layout
        let signUpButtonLayout: GeneralButton.Layout
        let signInButtonLayout: GeneralButton.Layout

        // MARK: - Initializer

        init(
            titleText: String,
            titleFont: Font = .title,
            subTitleText: String = "",
            subTitleFont: Font = .title2,
            titleSubTitleSpacerSize: CGFloat = 5.0,
            spacerSize: CGFloat = 10.0,
            accountIdFieldLayout: LabeledInputTextView.Layout,
            firstPasswordFieldLayout: LabeledInputPasswordView.Layout,
            secondPasswordFieldLayout: LabeledInputPasswordView.Layout,
            signUpButtonLayout: GeneralButton.Layout,
            signInButtonLayout: GeneralButton.Layout
        ) {
            self.titleText = titleText
            self.titleFont = titleFont
            self.subTitleText = subTitleText
            self.subTitleFont = subTitleFont
            self.titleSubTitleSpacerSize = titleSubTitleSpacerSize
            self.spacerSize = spacerSize
            self.accountIdFieldLayout = accountIdFieldLayout
            self.firstPasswordFieldLayout = firstPasswordFieldLayout
            self.secondPasswordFieldLayout = secondPasswordFieldLayout
            self.signUpButtonLayout = signUpButtonLayout
            self.signInButtonLayout = signInButtonLayout
        }
    }

}

#Preview {
    SignView(
        mode: SignView.Mode.signUp,
        layout: SignView.Layout(
            signInLayout: SignView.SignInLayout(
                titleText: "Sign in",
                accountIdFieldLayout: LabeledInputTextView.Layout(
                    labelText: "Please enter account id.",
                    inputText: "",
                    textLayout: TextView.Layout(
                        placeholder: "Please enter your name.",
                        keyboardType: .asciiCapableNumberPad,
                        maxLength: 16
                    )
                ),
                passwordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter password.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        placeholder: "8 to 16 half-width alphanumeric characters.",
                        maxLength: 16
                    )
                ),
                signInButtonLayout: GeneralButton.Layout(
                    text: "Sign in",
                    height: 40,
                    textForegroundColor: .white,
                    backgroundColor: .cyan,
                    hasBorder: true,
                    cornerRadius: 16
                ),
                signUpButtonLayout: GeneralButton.Layout(
                    text: "If you already have an account, sign in",
                    height: 40,
                    textForegroundColor: .gray,
                    hasTextUnderLine: true,
                    backgroundColor: .clear,
                    hasBorder: false,
                    cornerRadius: 16
                )
            ),
            signUpLayout: SignView.SignUpLayout(
                titleText: "Sign up",
                accountIdFieldLayout: LabeledInputTextView.Layout(
                    labelText: "Please enter account id.",
                    inputText: "",
                    textLayout: TextView.Layout(
                        placeholder: "Please enter your name.",
                        keyboardType: .asciiCapableNumberPad,
                        maxLength: 16
                    )
                ),
                firstPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter password.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        placeholder: "8 to 16 half-width alphanumeric characters.",
                        maxLength: 16
                    )
                ),
                secondPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter your password again.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        placeholder: "8 to 16 half-width alphanumeric characters.",
                        maxLength: 16
                    )
                ),
                signUpButtonLayout: GeneralButton.Layout(
                    text: "Sign up",
                    height: 40,
                    textForegroundColor: .white,
                    backgroundColor: .cyan,
                    hasBorder: true,
                    cornerRadius: 16
                ),
                signInButtonLayout: GeneralButton.Layout(
                    text: "Sign in because you don't have an account",
                    height: 40,
                    textForegroundColor: .gray,
                    hasTextUnderLine: true,
                    backgroundColor: .clear,
                    hasBorder: false,
                    cornerRadius: 16
                )
            )
        )
    )
}
