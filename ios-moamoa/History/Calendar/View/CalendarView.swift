//
//  CalendarView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/17.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @State var isDetailPresenting: Bool = false
    @State var presentedDetailDate: Date = Date()
    var viewModel: CalendarViewModel
        
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CalendarHeaderView(totalIncome: self.viewModel.totalIncome, totalSpending: self.viewModel.totalSpending)
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
            .cornerRadius(radius: 40, corners: .topRight)
            .cornerRadius(radius: 40, corners: .topLeft)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            self.viewModel[self.presentedDetailDate].flatMap { itemViewModel in
                GeometryReader { geometry in
                    BottomSheetView(isPresenting: self.$isDetailPresenting, height: geometry.size.height) {
                        VStack {
                            CalendarDetailPagingView(presentedDate: itemViewModel.date)
                            Spacer()
                        }
                    }
                }.edgesIgnoringSafeArea(.all)
            }
        }
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
                        return AnyView(CalendarItemView(viewModel: itemViewModel)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                        self.isDetailPresenting = true
                                        self.presentedDetailDate = itemViewModel.date
                                })
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

