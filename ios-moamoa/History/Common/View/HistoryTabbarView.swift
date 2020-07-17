//
//  HistoryTabbarView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/12.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct HistoryTabbarView: View {
    @Binding var currentPage: HistoryPage
    
    var body: some View {
        HStack(spacing: 47) {
            Button(action: {
                withAnimation(.spring(dampingFraction: 0.65)) {
                    self.$currentPage.wrappedValue = .calendar
                }
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 86, height: 33)
                        .foregroundColor(Color.white.opacity(0.25))
                        .cornerRadius(23)
                        .scaleEffect(currentPage == .calendar ? 1 : 0)
                    Text(Str.historyCalendarName)
                        .font(.system(size: 15, weight: .heavy))
                        .foregroundColor(.white)
                }
            }
            
            Rectangle()
                .frame(width: 1, height: 18)
                .foregroundColor(.white)
            
            Button(action: {
                withAnimation(.spring(dampingFraction: 0.65)) {
                    self.$currentPage.wrappedValue = .list
                }
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 86, height: 33)
                        .foregroundColor(Color.white.opacity(0.25))
                        .cornerRadius(23)
                        .scaleEffect(currentPage == .list ? 1 : 0)
                    Text(Str.historyListName)
                        .font(.system(size: 15, weight: .heavy))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct HistoryTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTabbarView(currentPage: .constant(.calendar))
            .background(Color.mainColor)
    }
}
