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
    @State private var presentedDate: Date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
                .frame(maxHeight: 62)
            HistoryHeaderView(presentedDate: $presentedDate)
            HistoryTabbarView(currentPage: $currentPage)
            CalendarView(viewModel:
                CalendarViewModel(
                    date: presentedDate,
                    totalIncome: 10000000,
                    totalSpending: -1000000
                )
            )
        }
        .background(Color.mainColor.edgesIgnoringSafeArea(.top))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
