//
//  AsyncImageView.swift
//  CompactUI
//  
//  Created by 190yamayama on 2024/04/20
//  
//

import SwiftUI

struct AsyncImageView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: AsyncImageViewModel
    let urlString: String
    let noImage: Image
    let layout: Layout

    // MARK: - Initializer

    init(
        urlString: String,
        layout: Layout,
        cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad,
        noImage: Image = Image(systemName: "autostartstop.trianglebadge.exclamationmark")
    ) {
        self.urlString = urlString
        self.layout = layout
        self.noImage = noImage
        self.viewModel = AsyncImageViewModel(
            url: urlString,
            cachePolicy: cachePolicy
        )
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .center, content: {
            Spacer().frame(width: layout.topMargin)
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Spacer().frame(width: layout.leftMargin)
                if let imageData = viewModel.downloadData,
                   let image = UIImage(data: imageData) {
                    if layout.hasBorder {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .background(layout.backgroundColor)
                            .cornerRadius(layout.cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: layout.cornerRadius)
                                    .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                            )
                    } else {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .background(layout.backgroundColor)
                            .cornerRadius(layout.cornerRadius)
                    }
                } else {
                    if layout.hasBorder {
                        noImage
                            .resizable()
                            .scaledToFit()
                            .background(layout.backgroundColor)
                            .overlay(
                                RoundedRectangle(cornerRadius: layout.cornerRadius)
                                    .stroke(layout.borderColor, lineWidth: layout.borderWidth)
                            )
                    } else {
                        noImage
                            .resizable()
                            .scaledToFit()
                            .background(layout.backgroundColor)
                            .cornerRadius(layout.cornerRadius)
                    }
                }
                Spacer().frame(width: layout.rightMargin)
            })
            Spacer().frame(width: layout.bottomMargin)
        })
    }

}

// MARK: - Layout
extension AsyncImageView {
    final class Layout: BaseLayout {
    }
}


#Preview {
    VStack {
        AsyncImageView(
            urlString: "https://aaaaaaaaaaaaa.com",
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
    }
}
