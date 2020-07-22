//
//  CalendarDetailView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/21.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct CalendarDetailView: View {
    @Binding var presentedDate: Date
    var viewModel: CalendarItemViewModel
    
    private var header: some View {
        HStack {
            Spacer()
                .frame(maxWidth: 32)
            Button(action: {
                guard let previousDayDate = Calendar.current.date(byAdding: .day, value: -1, to: self.presentedDate) else { return }
                self.$presentedDate.wrappedValue = previousDayDate
            }) {
                Image("btn_arrow_back")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.defaultTextColor)
            }
            Spacer()
            Text("\(presentedDate, formatter: DateFormatter.withDot)")
                .frame(width: 150, height: 25)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.defaultTextColor)
            Spacer()
            Button(action: {
                guard let nextDayDate = Calendar.current.date(byAdding: .day, value: 1, to: self.presentedDate) else { return }
                self.$presentedDate.wrappedValue = nextDayDate
            }) {
                Image("btn_arrow_forward")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.defaultTextColor)
            }
            Spacer()
                .frame(maxWidth: 32)
        }
    }
    
    var body: some View {
        VStack(spacing: 35) {
            header
            if self.viewModel.dayHistory.isEmpty {
                Spacer()
                Text(Str.emptyDailyDetailListMessage)
                    .font(.system(size: 14))
                Spacer()
            } else {
                DailyHistoryList(viewModel: self.viewModel)
            }
        }
    }
}

struct CalendarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetailView(presentedDate: .constant(Date()), viewModel: CalendarItemViewModel(date: Date()))
    }
}

