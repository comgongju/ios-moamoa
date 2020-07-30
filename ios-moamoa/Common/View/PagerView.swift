//
//  PagerView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/30.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

protocol Pagable {
    func actionNextPage()
    func actionPreviousPage()
}

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content
    
    @GestureState private var translation: CGFloat = 0
    
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture()
                    .updating(self.$translation) { value, state, _ in
                        state = value.translation.width
                    }
                    .onEnded { value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = Int((CGFloat(self.currentIndex) - offset).rounded())
                        if let detailPageView = self.content as? Pagable {
                            if newIndex > self.currentIndex {
                                detailPageView.actionNextPage()
                            } else if newIndex < self.currentIndex {
                                detailPageView.actionPreviousPage()
                            }
                        }
                        self.currentIndex = 1
//                      self.currentIndex = min(max(newIndex, 0), self.pageCount - 1)
                    }
            )
        }
    }
}
