![SPM is supported](https://img.shields.io/badge/SPM-Supported-green)
![Compatible with iOS15 and above](https://img.shields.io/badge/iOS-iOS15_or_later_Supported-green)
![Compatible with OSX1３ and above](https://img.shields.io/badge/OSX-OSX13_or_later_Supported-green)

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

・・・　more defined ・・・

```

# Atoms

## GeneralTextView sample

| iOS | MacOS |
| --- | --- |
| <img width="404" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/22060203-7ba1-4778-bba9-cdafc8539e74"> | <img width="607" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/da619370-0e42-4734-b494-0e8217371b72"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        GeneralTextView(
            text: "",
            layout: GeneralTextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: true
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        GeneralTextView(
            text: "",
            layout: GeneralTextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#else
    VStack {
        GeneralTextView(
            text: "",
            layout: GeneralTextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: true
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        GeneralTextView(
            text: "",
            layout: GeneralTextView.Layout(
                maxLength: 16,
                placeholder: "Please enter your name.",
                hasBorder: false
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#endif
```
</details>

## GeneralPasswordTextView sample

| iOS | MacOS |
| --- | --- |
| <img width="298" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/8e303e90-6ef8-4b4c-b977-a544bdaef2cf"> | <img width="603" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/882f33cb-c98d-496e-83c9-6cbe3b9e788f"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
                hasInputTextDisplayButton: true,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
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
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
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
    }
#else
    VStack {
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
                hasInputTextDisplayButton: true,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
                hasInputTextDisplayButton: false,
                placeholder: "8 to 16 half-width alphanumeric characters."
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
        .environment(\.colorScheme, .dark)
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
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
        GeneralPasswordTextView(
            secureText: "",
            layout: GeneralPasswordTextView.Layout(
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
    }
#endif
```
</details>

## GeneralSliderView sample

| iOS | MacOS |
| --- | --- |
| <img width="294" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/5f621ff6-1f14-484d-9cea-a172e1b03b8a"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/ee81eac8-a721-493a-a8fe-b1ae22891226"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: SliderView.Layout(
                sliderColor: .green,
                hasBorder: false
            )
        )
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: SliderView.Layout(
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
            layout: SliderView.Layout(
                sliderColor: .green,
                backgroundColor: .gray,
                hasBorder: false
            )
        )
        GeneralSliderView(
            value: 0,
            minValue: -100,
            maxValue: 100,
            layout: SliderView.Layout(
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
```
</details>

## GeneralButtonView sample

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/79847d5f-9774-4f34-86c3-d3fbc3c06d93"> | <img width="602" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/6057a1d5-ee2e-4351-af3f-7abfbd498b56"> |

<details><summary>example code</summary>

```swift
    VStack {
        GeneralButtonView(
            layout: GeneralButtonView.Layout(
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
        GeneralButtonView(
            layout: GeneralButtonView.Layout(
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
        GeneralButtonView(
            layout: GeneralButtonView.Layout(
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
        GeneralButtonView(
            layout: GeneralButtonView.Layout(
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
    }
```
</details>

## GeneralTabView sample

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/d0bbe9ec-45e2-4d05-b85d-e6eb31d78840"> | <img width="602" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/39a71252-4ff5-44a7-9821-abc6ec6ec1b5"> |

<details><summary>example code</summary>

```swift
    VStack {
        GeneralTabView(
            tabContents: [
                TabContent(
                    id: 0,
                    title: "Personal",
                    content: PageView(text: "1st")
                ),
                TabContent(
                    id: 1,
                    title: "Trending",
                    content: PageView(text: "2nd")
                ),
                TabContent(
                    id: 2,
                    title: "Country News",
                    content: PageView(text: "3rd")
                ),
                TabContent(
                    id: 3,
                    title: "World News",
                    content: PageView(text: "4th")
                )
            ],
            selection: 1,
            layout: .init(displayTabCount: .three), 
            onChangeTab: { index in
                print("index=\(index)")
            }
        )
        GeneralTabView(
            tabContents: [
                TabContent(
                    id: 0,
                    title: "Personal",
                    content: PageView(text: "1st")
                ),
                TabContent(
                    id: 1,
                    title: "Trending",
                    content: PageView(text: "2nd")
                ),
                TabContent(
                    id: 2,
                    title: "Country News",
                    content: PageView(text: "3rd")
                ),
                TabContent(
                    id: 3,
                    title: "World News",
                    content: PageView(text: "4th")
                ),
                TabContent(
                    id: 4,
                    title: "Universe News",
                    content: PageView(text: "5th")
                )
            ],
            selection: 3,
            layout: .init(displayTabCount: .four),
            onChangeTab: { index in
                print("index=\(index)")
            }
        )
    }
```
</details>

## GeneralStaticImageView sample

| iOS | MacOS |
| --- | --- |
| <img width="397" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/f303937e-c75f-4e18-9c57-a58cc8878bd6"> | <img width="605" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/7c44f895-0a91-4ad8-a06c-ce7b697a6f12"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        GeneralStaticImageView(
            image: Image(systemName: "autostartstop.trianglebadge.exclamationmark"),
            layout: GeneralStaticImageView.Layout(
                backgroundColor: .yellow,
                borderColor: .red,
                borderWidth: 3
            )
        )
        GeneralStaticImageView(
            image: Image(systemName: "autostartstop.trianglebadge.exclamationmark"),
            layout: GeneralStaticImageView.Layout(
                backgroundColor: .green,
                hasBorder: false
            )
        )
    }
#else
    VStack {
        GeneralStaticImageView(
            image: Image(systemName: "autostartstop.trianglebadge.exclamationmark"),
            layout: GeneralStaticImageView.Layout(
                backgroundColor: .yellow,
                borderColor: .red,
                borderWidth: 3
            )
        )
        GeneralStaticImageView(
            image: Image(systemName: "autostartstop.trianglebadge.exclamationmark"),
            layout: GeneralStaticImageView.Layout(
                backgroundColor: .green,
                hasBorder: false
            )
        )
    }
#endif
```
</details>

## GeneralAsyncImageView sample

| iOS | MacOS |
| --- | --- |
| <img width="280" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/abd91bf0-fb18-40ca-ac5a-4f1f18d12247"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/c48ceb9c-bd8e-4dff-a54f-937f4a16530f"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        GeneralAsyncImageView(
            urlString: "https://aaaaaaaaaaaaa.com",
            layout: GeneralAsyncImageView.Layout(
                borderColor: .green,
                borderWidth: 2
            )
        )
        GeneralAsyncImageView(
            urlString: "https://aaaaaaaaaaaaa.co.jp",
            layout: GeneralAsyncImageView.Layout(
                hasBorder: false
            )
        )
    }
#else
    VStack {
        GeneralAsyncImageView(
            urlString: "https://aaaaaaaaaaaaa.com",
            layout: GeneralAsyncImageView.Layout(
                borderColor: .green,
                borderWidth: 2
            )
        )
        GeneralAsyncImageView(
            urlString: "https://aaaaaaaaaaaaa.co.jp",
            layout: GeneralAsyncImageView.Layout(
                hasBorder: false
            )
        )
    }
#endif
```
</details>


# Molecules

## LabeledInputTextView sample

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/8708588a-2a92-4ee9-8734-aef4a138f744"> | <img width="611" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/df1cce0d-18b5-430a-a5cd-60d707651366"> |

<details><summary>example code</summary>

```swift
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
```
</details>

## LabeledInputPasswordView sample

| iOS | MacOS |
| --- | --- |
| <img width="297" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/24c82322-0e68-458a-ad24-6d8d03024b8a"> | <img width="611" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/f030bf47-ff14-49c7-ad73-0dc665b0727c"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        LabeledInputPasswordView(
            layout: LabeledInputPasswordView.Layout(
                labelText: "Please enter password.",
                passwordText: "",
                alignment: .horizontal,
                labelLayout: BaseLabelLayout(textForegroundColor: .gray),
                passwordLayout: GeneralPasswordTextView.Layout(
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
                passwordLayout: GeneralPasswordTextView.Layout(
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
                passwordLayout: GeneralPasswordTextView.Layout(
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
                passwordLayout: GeneralPasswordTextView.Layout(
                    placeholder: "8 to 16 half-width alphanumeric characters."
                )
            ),
            onSubmitText: { value  in
                print(value)
            }
        )
    }
#endif
```
</details>

## LabeledSegmentPickerView sample

| iOS | MacOS |
| --- | --- |
| <img width="297" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/d3e1a9dd-1392-44b5-bacf-b694083f6521"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/24367030-c47e-4442-88f5-d22f8fa9f119"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
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
    }
#else
    VStack {
        LabeledSegmentPickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledSegmentPickerView.Layout(
                alignment: .horizontal,
                titleTextColor: .green,
                titleAlignment: .leading
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
            layout: LabeledSegmentPickerView.Layout(
                alignment: .vertical,
                titleTextColor: .green,
                titleAlignment: .leading
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#endif
```
</details>

## LabeledInlinePickerView sample

| iOS | MacOS |
| --- | --- |
| <img width="298" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/de8572ef-49fc-46ce-835f-bb91ee7adb24"> | <img width="608" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/692bd8ad-d18b-46e3-945d-0a62cdb32ce2"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
        LabeledInlinePickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledInlinePickerView.Layout(
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
            layout: LabeledInlinePickerView.Layout(
                alignment: .vertical
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#else
    VStack {
        LabeledInlinePickerView(
            selectedKey: "default",
            labelText: "Language",
            items: [
                (key: "default", value: "System"),
                (key: "en", value: "English"),
                (key: "jp", value: "Japanese")
            ],
            layout: LabeledInlinePickerView.Layout(
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
            layout: LabeledInlinePickerView.Layout(
                alignment: .vertical, 
                titleTextColor: .white,
                titleAlignment: .center
            ),
            onSelected: { value in
                print(value)
            }
        )
    }
#endif
```
</details>

## LabeledDropdownListView sample

| iOS | MacOS |
| --- | --- |
| <img width="300" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/6107fad2-398d-4ebc-84b1-8f65e2b9c5bb"> | <img width="605" alt="image" src="https://github.com/190yamayama2/CompactUI/assets/154570413/41c40d6b-ea8a-4858-a457-cd989eb74eb3"> |

<details><summary>example code</summary>

```swift
#if os(iOS)
    VStack {
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
    }
#else
    VStack {
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
        LabeledDropdownListView(
            selectedKey: "en",
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
        LabeledDropdownListView(
            selectedKey: "en",
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
        LabeledDropdownListView(
            selectedKey: "jp",
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
    }
#endif
```
</details>
