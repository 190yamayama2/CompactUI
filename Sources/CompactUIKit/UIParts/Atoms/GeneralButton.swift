//
//  GeneralButton.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

public struct GeneralButton: View {

    // MARK: - Layout Property

    let layout: Layout
    var tapAction: (() -> Void)

    // MARK: - View

    public var body: some View {
#if os(iOS)
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            Spacer().frame(width: layout.leftMargin)
            if layout.hasBorder {
                Button(action: {
                    tapAction()
                }, label: {
                    layout.hasTextUnderLine
                        ? Text(layout.text).underline()
                        : Text(layout.text)
                })
                .font(layout.textFont)
                .foregroundColor(layout.textForegroundColor)
                .frame(maxWidth: .infinity, maxHeight: layout.height)
                .background(layout.backgroundColor)
                .cornerRadius(layout.cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: layout.cornerRadius)
                        .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                )
            } else {
                Button(action: {
                    tapAction()
                }, label: {
                    layout.hasTextUnderLine
                        ? Text(layout.text).underline()
                        : Text(layout.text)
                })
                .font(layout.textFont)
                .foregroundColor(layout.textForegroundColor)
                .frame(maxWidth: .infinity, maxHeight: layout.height)
                .background(layout.backgroundColor)
                .cornerRadius(layout.cornerRadius)
            }
            Spacer().frame(width: layout.rightMargin)
        })
#else
        if layout.hasBorder {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Spacer().frame(width: layout.leftMargin)
                if layout.hasTextUnderLine {
                    Text(layout.text).underline()
                        .background(.clear)
                        .border(.clear)
                        .font(layout.textFont)
                        .foregroundColor(layout.textForegroundColor)
                        .frame(maxWidth: .infinity, maxHeight: layout.height)
                        .background(layout.backgroundColor)
                        .cornerRadius(layout.cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: layout.cornerRadius)
                                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                        )
                        .onSubmit {
                            tapAction()
                        }
                } else {
                    Text(layout.text)
                        .background(.clear)
                        .border(.clear)
                        .font(layout.textFont)
                        .foregroundColor(layout.textForegroundColor)
                        .frame(maxWidth: .infinity, maxHeight: layout.height)
                        .background(layout.backgroundColor)
                        .cornerRadius(layout.cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: layout.cornerRadius)
                                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                        )
                        .onSubmit {
                            tapAction()
                        }
                }
                Spacer().frame(width: layout.rightMargin)
            })
        } else {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Spacer().frame(width: layout.leftMargin)
                if layout.hasTextUnderLine {
                    Text(layout.text).underline()
                        .font(layout.textFont)
                        .foregroundColor(layout.textForegroundColor)
                        .frame(maxWidth: .infinity, maxHeight: layout.height)
                        .background(layout.backgroundColor)
                        .cornerRadius(layout.cornerRadius)
                } else {
                    Text(layout.text)
                        .font(layout.textFont)
                        .foregroundColor(layout.textForegroundColor)
                        .frame(maxWidth: .infinity, maxHeight: layout.height)
                        .background(layout.backgroundColor)
                        .cornerRadius(layout.cornerRadius)
                }
                Spacer().frame(width: layout.rightMargin)
            })
            .onSubmit {
                tapAction()
            }
        }
#endif
    }

}

// MARK: - Layout
extension GeneralButton {
    final class Layout: BaseButtonLayout { }
}

// MARK: - Preview
#Preview {
    VStack {
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
    }
}
