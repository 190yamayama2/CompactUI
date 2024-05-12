//
//  SignView.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/30
//  
//

import SwiftUI

public struct SignView: View {

    // MARK: - Enum

    public enum Mode {
        case signIn
        case signUp
    }

    // MARK: - Properties

    @State var mode: Mode
    let layout: Layout

    // MARK: - Initializer

    public init(mode: Mode, layout: Layout) {
        self.mode = mode
        self.layout = layout
    }

    // MARK: - View

    public var body: some View {
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
            Spacer(minLength: layout.signUpLayout.spacerSize)
            Spacer()
            Text(layout.signInLayout.titleText)
                .font(layout.signInLayout.titleFont)
            Spacer()
            Text(layout.signInLayout.subTitleText)
                .font(layout.signInLayout.subTitleFont)
            Spacer(minLength: layout.signInLayout.spacerSize)
            LabeledInputTextView(
                layout: layout.signInLayout.accountIdFieldLayout,
                onSubmitText: { value in
                    print(value)
                }
            )
            LabeledInputPasswordView(
                layout: layout.signInLayout.passwordFieldLayout,
                onSubmitText: { value in
                    print(value)
                }
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
            Spacer(minLength: layout.signUpLayout.spacerSize)
            Spacer()
            Text(layout.signUpLayout.titleText)
                .font(layout.signUpLayout.titleFont)
            Spacer(minLength: layout.signUpLayout.spacerSize)
            Spacer()
            LabeledInputTextView(
                layout: layout.signUpLayout.accountIdFieldLayout,
                onSubmitText: { value in
                    print(value)
                }
            )
            LabeledInputPasswordView(
                layout: layout.signUpLayout.firstPasswordFieldLayout,
                onSubmitText: { value in
                    print(value)
                }
            )
            LabeledInputPasswordView(
                layout: layout.signUpLayout.secondPasswordFieldLayout,
                onSubmitText: { value in
                    print(value)
                }
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
                ),
                onSelected: { value in
                    print(value)
                }
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            GeneralButton(
                layout: layout.signUpLayout.signUpButtonLayout,
                tapAction: {

                }
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            GeneralButton(
                layout: layout.signUpLayout.signInButtonLayout,
                tapAction: {
                    mode = .signIn
                }
            )
            Spacer().frame(height: layout.signUpLayout.spacerSize)
            Spacer()
            Spacer().frame(height: layout.signUpLayout.spacerSize)
        })
    }
}

// MARK: - Layout
extension SignView {

    public struct Layout {

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

    public struct SignInLayout {

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

    public struct SignUpLayout {

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

        public init(
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
#if os(iOS)
    SignView(
        mode: SignView.Mode.signUp,
        layout: SignView.Layout(
            signInLayout: SignView.SignInLayout(
                titleText: "Sign in",
                accountIdFieldLayout: LabeledInputTextView.Layout(
                    labelText: "Please enter account id.",
                    inputText: "",
                    textLayout: TextView.Layout(
                        maxLength: 16,
                        placeholder: "Please enter your name."
                    )
                ),
                passwordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter password.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        maxLength: 16,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                signInButtonLayout: GeneralButton.Layout(
                    text: "Sign in",
                    height: 40,
                    textForegroundColor: .white,
                    backgroundColor: .gray,
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
                        maxLength: 16,
                        placeholder: "Please enter your name."
                    )
                ),
                firstPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter password.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        maxLength: 16,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                secondPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter your password again.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        maxLength: 16,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                signUpButtonLayout: GeneralButton.Layout(
                    text: "Sign up",
                    height: 40,
                    textForegroundColor: .white,
                    backgroundColor: .gray,
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
#else
    SignView(
        mode: SignView.Mode.signUp,
        layout: SignView.Layout(
            signInLayout: SignView.SignInLayout(
                titleText: "Sign in",
                accountIdFieldLayout: LabeledInputTextView.Layout(
                    labelText: "Please enter account id.",
                    inputText: "",
                    textLayout: TextView.Layout(
                        maxLength: 16,
                        placeholder: "Please enter your name."
                    )
                ),
                passwordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter password.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        maxLength: 16,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                signInButtonLayout: GeneralButton.Layout(
                    text: "Sign in",
                    height: 40,
                    textForegroundColor: .white,
                    backgroundColor: .gray,
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
                        maxLength: 16,
                        placeholder: "Please enter your name."
                    )
                ),
                firstPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter password.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        maxLength: 16,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                secondPasswordFieldLayout: LabeledInputPasswordView.Layout(
                    labelText: "Please enter your password again.",
                    passwordText: "",
                    passwordLayout: PasswordTextView.Layout(
                        maxLength: 16,
                        placeholder: "8 to 16 half-width alphanumeric characters."
                    )
                ),
                signUpButtonLayout: GeneralButton.Layout(
                    text: "Sign up",
                    height: 40,
                    textForegroundColor: .white,
                    backgroundColor: .accentColor,
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
#endif
}
