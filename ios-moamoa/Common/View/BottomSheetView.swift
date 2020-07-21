//
//  BottomSheetView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/21.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct BottomSheetView<Content: View>: View {
    @Binding var isPresenting: Bool
    @GestureState private var translation: CGFloat = 0
    
    let height: CGFloat
    let content: Content
    
    init(isPresenting: Binding<Bool>, height: CGFloat, content: () -> Content) {
        self._isPresenting = isPresenting
        self.height = height
        self.content = content()
    }
    
    private var offset: CGFloat {
        isPresenting ? 0 : UIScreen.main.bounds.height
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: 22)
            .foregroundColor(Color(red: 0.883, green: 0.883, blue: 0.883))
            .frame(width: 54, height: 5)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.isPresenting {
                    Color.black.opacity(0.4)
                        .coordinateSpace(name: "background")
                        .offset(y: -geometry.frame(in: .named("background")).origin.y / 2)
                        .animation(.easeInOut)
                }
                VStack(spacing: 35) {
                    self.indicator
                        .padding(.top, 10)
                    self.content
                }
                .frame(width: geometry.size.width, height: self.height, alignment: .top)
                .background(Color.white)
                .cornerRadius(radius: 40, corners: .topLeft)
                .cornerRadius(radius: 40, corners: .topRight)
                .frame(height: geometry.size.height, alignment: .bottom)
                .offset(y: max(self.offset + self.translation, 0))
                .animation(.interactiveSpring())
                .gesture(
                    DragGesture()
                        .updating(self.$translation) { value, state, _ in
                            state = value.translation.height
                        }
                    .onEnded { value in
                        let snapDistance = self.height / 4
                        guard abs(value.translation.height) > snapDistance else {
                            return
                        }
                        self.isPresenting = value.translation.height < 0
                    }
                )
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isPresenting: .constant(true), height: 652) {
            Color.blue
        }
    }
}
