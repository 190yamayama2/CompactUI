# ・・・　Under maintenance ・・・



# CompactUI

This project aims to be a collection of atomic design parts of SwiftUI.

# Default style

A structure that collectively defines standard layouts.
Even if defined here, it can be overridden individually in each component's initialization.

LayoutDefault.swift

```swift
/// Default topMargin
public static var topMargin: CGFloat = 16.0
/// Default leftMargin
public static var leftMargin: CGFloat = 16.0
/// Default rightMargin
public static var rightMargin: CGFloat = 16.0
/// Default bottomMargin
public static var bottomMargin: CGFloat = 16.0
/// Default backgroundColor
public static var backgroundColor: Color = .clear
/// Default borderColor
public static var borderColor: Color = Color.gray
/// Default borderWidth
public static var borderWidth: CGFloat = 1.0
/// Default cornerRadius
public static var cornerRadius: CGFloat = 16
/// Default primaryFont
public static var primaryFont: Font = .system(size: 12.0)
/// Default primaryFontColor
public static var primaryFontColor: Color = isDarkMode ? .white : .black
/// Default fontSecondary
public static var secondaryFont: Font = .system(size: 10.0)
/// Default secondaryFontColor
public static var secondaryFontColor: Color = .gray
/// Default primaryUIFont
public static var primaryUIFont: UIFont = .systemFont(ofSize: 12.0)
/// Default primaryFontUIColor
public static var primaryFontUIColor: UIColor = .black
/// Default secondaryUIFont
public static var secondaryUIFont: UIFont = .systemFont(ofSize: 10.0)
/// Default secondaryFontUIColor
public static var secondaryFontUIColor: UIColor = .gray
```

# Atoms

## TextView sample

<img width="404" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/22060203-7ba1-4778-bba9-cdafc8539e74">

```swift
TextView(
    text: "",
    layout: TextView.Layout(
        placeholder: "Please enter your name.",
        maxLength: 16,
        hasBorder: true
    )
) 
```

## PasswordTextView sample

<img width="402" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/dc65f760-b2db-4e3a-ac4f-9c988cb11c0d">

```swift
PasswordTextView(
    secureText: "",
    layout: PasswordTextView.Layout(
        placeholder: "8 to 16 half-width alphanumeric characters.",
        keyboardType: .asciiCapableNumberPad,
        hasInputTextDisplayButton: true
    )
)
PasswordTextView(
    secureText: "",
    layout: PasswordTextView.Layout(
        placeholder: "8 to 16 half-width alphanumeric characters.",
        keyboardType: .asciiCapableNumberPad,
        hasInputTextDisplayButton: false
    )
)
```

## GeneralButton sample

<img width="400" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/2b591bbf-91cd-4b84-b796-e63c7a610f01">

```swift
GeneralButton(
    layout: GeneralButton.Layout(
        text: "Sign up",
        height: 40,
        textForegroundColor: .white,
        backgroundColor: .mint,
        hasBorder: true
    ), tapAction: { }
)
GeneralButton(
    layout: GeneralButton.Layout(
        text: "I have an account, so sign in.",
        height: 40,
        textForegroundColor: .gray,
        hasTextUnderLine: true,
        backgroundColor: .clear,
        hasBorder: false
    ), tapAction: { }
)
```

## StaticImageView sample

<img width="397" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/f303937e-c75f-4e18-9c57-a58cc8878bd6">

```swift
StaticImageView(
    image: Image(systemName: "autostartstop.trianglebadge.exclamationmark"),
    layout: StaticImageView.Layout(
        backgroundColor: .yellow,
        borderColor: .red,
        borderWidth: 3
    )
)
StaticImageView(
    image: Image(systemName: "autostartstop.trianglebadge.exclamationmark"),
    layout: StaticImageView.Layout(
        backgroundColor: .cyan,
        hasBorder: false
    )
)
```

## AsyncImageView sample

<img width="398" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/7158198f-8f97-4663-8e5f-b80c487b6dea">

```swift
AsyncImageView(
    urlString: "https://aaaaaa.co.jp",
    layout: AsyncImageView.Layout(
        borderColor: .green,
        borderWidth: 2
    )
)
AsyncImageView(
    urlString: "https://aaaaaaaaaaaaa.co.jp",
    layout: AsyncImageView.Layout(
        hasBorder: false
    )
)
```

# Molecules

## LabeledInputTextView sample

<img width="399" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/046aade6-52f4-4185-8195-b689bce7591c">

```swift
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
LabeledInputTextView(
    layout: LabeledInputTextView.Layout(
        labelText: "Please enter account id.",
        inputText: "",
        alignment: .vertical,
        labelLayout: BaseLabelLayout(
            textForegroundColor: .gray
        ),
        textLayout: TextView.Layout(
            placeholder: "Please enter your name."
        )
    )
)
```

## LabeledInputPasswordView sample

<img width="397" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/5623a22f-c86f-4d41-be3b-7624e3502f56">

```swift
LabeledInputPasswordView(
    layout: LabeledInputPasswordView.Layout(
        labelText: "Please enter password.",
        passwordText: "",
        alignment: .horizontal,
        labelLayout: BaseLabelLayout(textForegroundColor: .gray),
        passwordLayout: PasswordTextView.Layout(
            placeholder: "8 to 16 half-width alphanumeric characters."
        )
    )
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
    )
)
```

## LabeledSegmentPickerView sample

<img width="396" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/21c6783f-b297-4bb6-a49c-92fb11b82336">

```swift
LabeledSegmentPickerView(
    selectedKey: "",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledSegmentPickerView.Layout(
        titleTextColor: .green,
        titleAlignment: .leading
    )
)
LabeledSegmentPickerView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledSegmentPickerView.Layout(
        titleTextColor: .green,
        titleAlignment: .leading
    )
)
LabeledSegmentPickerView(
    selectedKey: "en",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledSegmentPickerView.Layout(
        titleTextColor: .red,
        titleAlignment: .center,
        backgroundColor: .green
    )
)
LabeledSegmentPickerView(
    selectedKey: "jp",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledSegmentPickerView.Layout(
        titleTextColor: .blue,
        titleAlignment: .trailing,
        backgroundColor: .green
    )
)
```

## LabeledWheelPickerView sample

<img width="397" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/b3b0ca10-9cee-442d-b88d-56ce2d5eca98">

```swift
LabeledWheelPickerView(
    selectedKey: "jp",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    pickerViewStyle: .inline,
    layout: LabeledWheelPickerView.Layout(
        alignment: .horizontal
    )
)
LabeledWheelPickerView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    pickerViewStyle: .wheel,
    layout: LabeledWheelPickerView.Layout(
        alignment: .vertical
    )
)
```

## LabeledDropdownListView sample

<img width="399" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/6e9e38db-5223-4161-8da9-bc1ab4e987d0">

```swift
LabeledDropdownListView(
    selectedKey: "jp",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledDropdownListView.Layout(
        alignment: .horizontal
    )
)
LabeledDropdownListView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledDropdownListView.Layout(
        alignment: .vertical
    )
)
```
