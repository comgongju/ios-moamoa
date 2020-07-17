//
//  HistoryView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

enum HistoryPage {
    case calendar
    case list
}

struct HistoryView: View {
    @State private var currentPage: HistoryPage = .calendar
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            HistoryTabbarView(currentPage: $currentPage)
        }
        .background(Color.mainColor)
        .edgesIgnoringSafeArea(.top)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
