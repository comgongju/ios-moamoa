//
//  CalendarView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    var viewModel: CalendarViewModel
        
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<7, id: \.self) { i in
                    Text(Str.weekdaysName[i])
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.ssubTextColor)
                        .font(Font.system(size: 10))
                        .padding(.top, 4)
                        .padding(.bottom, 1)
                }
            }.background(Color.layerSectionColor)
            setCalendarItem()
        }
        .background(Color.white)
    }
    
    private func setCalendarItem() -> some View {
        let startWeekdayOfMonth = self.viewModel.date.startOfMonth.weekday
        let weekNumOfMonth = self.viewModel.date.weekNumOfMonth
        return AnyView(ForEach(0..<weekNumOfMonth, id: \.self) { i in
            HStack(spacing: 0) {
                ForEach(0..<7) { j -> AnyView in
                    if i == 0 && j < startWeekdayOfMonth {
                        return AnyView(Color.white)
                    } else if self.viewModel.itemViewModel.count > i * 7 + j - startWeekdayOfMonth {
                        let itemViewModel = self.viewModel.itemViewModel[i * 7 + j - startWeekdayOfMonth]
                        return AnyView(CalendarItemView(viewModel: itemViewModel))
                    }
                    return AnyView(Color.white)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .border(Color.layerSectionColor, width: 0.7)
            }
        })
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewModel: CalendarViewModel(
            date: Date(),
            totalIncome: 10000000,
            totalSpending: -1000000)
        )
    }
}

