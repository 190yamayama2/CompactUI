
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

| iOS | MacOS |
| --- | --- |
| <img width="404" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/22060203-7ba1-4778-bba9-cdafc8539e74"> | <img width="607" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/da619370-0e42-4734-b494-0e8217371b72"> |

```swift
TextView(
    text: "",
    layout: TextView.Layout(
        maxLength: 16,
        placeholder: "Please enter your name.",
        hasBorder: true
    ),
    onSubmitText: { value  in
        print(value)
    }
)
TextView(
    text: "",
    layout: TextView.Layout(
        maxLength: 16,
        placeholder: "Please enter your name.",
        hasBorder: false
    ),
    onSubmitText: { value  in
        print(value)
    }
)
```

## PasswordTextView sample

| iOS | MacOS |
| --- | --- |
| <img width="298" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/8e303e90-6ef8-4b4c-b977-a544bdaef2cf"> | <img width="603" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/882f33cb-c98d-496e-83c9-6cbe3b9e788f"> |

```swift
PasswordTextView(
    secureText: "",
    layout: PasswordTextView.Layout(
        hasInputTextDisplayButton: true,
        placeholder: "8 to 16 half-width alphanumeric characters."
    ),
    onSubmitText: { value  in
        print(value)
    }
)
.environment(\.colorScheme, .dark)
PasswordTextView(
    secureText: "",
    layout: PasswordTextView.Layout(
        hasInputTextDisplayButton: false,
        placeholder: "8 to 16 half-width alphanumeric characters."
    ),
    onSubmitText: { value  in
        print(value)
    }
)
.environment(\.colorScheme, .dark)
PasswordTextView(
    secureText: "",
    layout: PasswordTextView.Layout(
        hasInputTextDisplayButton: false,
        placeholder: "8 to 16 half-width alphanumeric characters.",
        backgroundColor: .gray,
        hasBorder: false
    ),
    onSubmitText: { value  in
        print(value)
    }
)
.environment(\.colorScheme, .dark)
PasswordTextView(
    secureText: "",
    layout: PasswordTextView.Layout(
        hasInputTextDisplayButton: false,
        placeholder: "8 to 16 half-width alphanumeric characters.",
        backgroundColor: .gray,
        hasBorder: false
    ),
    onSubmitText: { value  in
        print(value)
    }
)
.environment(\.colorScheme, .dark)
```

## GeneralButton sample

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/79847d5f-9774-4f34-86c3-d3fbc3c06d93"> | <img width="602" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/6057a1d5-ee2e-4351-af3f-7abfbd498b56"> |

```swift
GeneralButton(
    layout: GeneralButton.Layout(
        text: "Sign up",
        height: 40,
        textForegroundColor: .white,
        hasTextUnderLine: true,
        backgroundColor: .gray,
        hasBorder: true
    ), tapAction: {
        print("tapped.")
    }
)
GeneralButton(
    layout: GeneralButton.Layout(
        text: "Sign up",
        height: 40,
        textForegroundColor: .white,
        hasTextUnderLine: false,
        backgroundColor: .gray,
        hasBorder: true
    ), tapAction: {
        print("tapped.")
    }
)
GeneralButton(
    layout: GeneralButton.Layout(
        text: "I have an account, so sign in.",
        height: 40,
        textForegroundColor: .gray,
        hasTextUnderLine: true,
        backgroundColor: .clear,
        hasBorder: false
    ), tapAction: {
        print("tapped.")
    }
)
GeneralButton(
    layout: GeneralButton.Layout(
        text: "I have an account, so sign in.",
        height: 40,
        textForegroundColor: .gray,
        hasTextUnderLine: false,
        backgroundColor: .clear,
        hasBorder: false
    ), tapAction: {
        print("tapped.")
    }
)
```

## StaticImageView sample

| iOS | MacOS |
| --- | --- |
| <img width="397" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/f303937e-c75f-4e18-9c57-a58cc8878bd6"> | <img width="605" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/7c44f895-0a91-4ad8-a06c-ce7b697a6f12"> |

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
        backgroundColor: .green,
        hasBorder: false
    )
)
```

## AsyncImageView sample

| iOS | MacOS |
| --- | --- |
| <img width="280" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/abd91bf0-fb18-40ca-ac5a-4f1f18d12247"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/c48ceb9c-bd8e-4dff-a54f-937f4a16530f"> |

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

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/8708588a-2a92-4ee9-8734-aef4a138f744"> | <img width="611" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/df1cce0d-18b5-430a-a5cd-60d707651366"> |

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
        textLayout: TextView.Layout(
            placeholder: "Please enter your name."
        )
    ),
    onSubmitText: { value  in
        print(value)
    }
)
```

## LabeledInputPasswordView sample

| iOS | MacOS |
| --- | --- |
| <img width="297" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/24c82322-0e68-458a-ad24-6d8d03024b8a"> | <img width="611" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/f030bf47-ff14-49c7-ad73-0dc665b0727c"> |

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
```

## LabeledSegmentPickerView sample

| iOS | MacOS |
| --- | --- |
| <img width="297" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/d3e1a9dd-1392-44b5-bacf-b694083f6521"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/24367030-c47e-4442-88f5-d22f8fa9f119"> |

```swift
LabeledSegmentPickerView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledSegmentPickerView.Layout(
        alignment: .vertical,
        titleTextColor: .gray,
        titleAlignment: .leading,
        segmentSelectedTextColor: .white,
        segmentBackgroundColor: .blue,
        backgroundColor: .red
    ),
    onSelected: { value in
        print(value)
    }
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
        alignment: .vertical,
        titleTextColor: .gray,
        titleAlignment: .center,
        segmentSelectedTextColor: .white,
        segmentBackgroundColor: .blue,
        backgroundColor: .red
    ),
    onSelected: { value in
        print(value)
    }
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
        alignment: .vertical,
        titleTextColor: .gray,
        titleAlignment: .trailing,
        segmentSelectedTextColor: .white,
        segmentBackgroundColor: .blue,
        backgroundColor: .red
    ),
    onSelected: { value in
        print(value)
    }
)
LabeledSegmentPickerView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    pickerViewStyle: .palette,
    layout: LabeledSegmentPickerView.Layout(
        alignment: .horizontal,
        titleTextColor: .gray,
        titleAlignment: .center,
        segmentSelectedTextColor: .white, 
        segmentBackgroundColor: .blue,
        backgroundColor: .red
    ),
    onSelected: { value in
        print(value)
    }
)
```

## LabeledInlinePickerView sample

| iOS | MacOS |
| --- | --- |
| <img width="298" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/de8572ef-49fc-46ce-835f-bb91ee7adb24"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/692bd8ad-d18b-46e3-945d-0a62cdb32ce2"> |

```swift
LabeledInlinePickerView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledWheelPickerView.Layout(
        alignment: .horizontal
    ),
    onSelected: { value in
        print(value)
    }
)
LabeledInlinePickerView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledWheelPickerView.Layout(
        alignment: .vertical
    ),
    onSelected: { value in
        print(value)
    }
)
```

## LabeledDropdownListView sample

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/6107fad2-398d-4ebc-84b1-8f65e2b9c5bb"> | <img width="605" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/41c40d6b-ea8a-4858-a457-cd989eb74eb3"> |

```swift
LabeledDropdownListView(
    selectedKey: "default",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledDropdownListView.Layout(
        alignment: .vertical,
        titleAlignment: .leading
    )
)
LabeledDropdownListView(
    selectedKey: "en",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledDropdownListView.Layout(
        alignment: .vertical,
        titleAlignment: .center
    )
)
LabeledDropdownListView(
    selectedKey: "jp",
    labelText: "Language",
    items: [
        (key: "default", value: "System"),
        (key: "en", value: "English"),
        (key: "jp", value: "Japanese")
    ],
    layout: LabeledDropdownListView.Layout(
        alignment: .vertical,
        titleAlignment: .trailing
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
        alignment: .horizontal
    )
)
```
