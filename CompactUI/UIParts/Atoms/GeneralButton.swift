//
//  GeneralButton.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/03/24
//  
//

import SwiftUI

struct GeneralButton: View {

    // MARK: - Layout Property

    let layout: Layout
    var tapAction: (() -> Void)

    // MARK: - View

    var body: some View {
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
                height: 40
            ), tapAction: { }
        )
        GeneralButton(
            layout: GeneralButton.Layout(
                text: "Sign in",
                height: 40,
                textForegroundColor: .gray,
                backgroundColor: .clear,
                hasBorder: true
            ), tapAction: { }
        )
    }
}
