//
//  GeneralStaticImageView.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/04/21
//  
//

import SwiftUI

public struct GeneralStaticImageView: View {

    // MARK: - Properties

    let image: Image
    let layout: Layout

    // MARK: - Initializer

    public init(
        image: Image,
        layout: Layout
    ) {
        self.image = image
        self.layout = layout
    }

    // MARK: - View

    public var body: some View {
        VStack(alignment: .center, content: {
            Spacer().frame(width: layout.topMargin)
            HStack(alignment: .center, content: {
                Spacer().frame(width: layout.leftMargin)
                if layout.hasBorder {
                    image
                        .resizable()
                        .scaledToFit()
                        .background(layout.backgroundColor)
                        .cornerRadius(layout.cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: layout.cornerRadius)
                                .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                        )
                } else {
                    image
                        .resizable()
                        .scaledToFit()
                        .background(layout.backgroundColor)
                        .cornerRadius(layout.cornerRadius)
                }
                Spacer().frame(width: layout.rightMargin)
            })
            Spacer().frame(width: layout.bottomMargin)
        })
    }
}

// MARK: - Layout
extension GeneralStaticImageView {
    final public class Layout: BaseLayout {
    }
}

// MARK: - Preview
#Preview {
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
}
