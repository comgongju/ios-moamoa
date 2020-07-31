//
//  HistoryHeaderView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/12.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct HistoryHeaderView: View {
    @Binding var presentedDate: Date
    
    var body: some View {
        HStack(spacing: 37) {
            Button(action: {
                guard let previousMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: self.presentedDate) else { return }
                self.$presentedDate.wrappedValue = previousMonthDate
            }) {
                Image("btn_arrow_back")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.mainColor)
            }

            Text("\(presentedDate, formatter: DateFormatter.yearCommaMonth)")
                .frame(width: 100, height: 25)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.mainColor)
            
            Button(action: {
                guard let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: self.presentedDate) else { return }
                self.$presentedDate.wrappedValue = nextMonthDate
            }) {
                Image("btn_arrow_forward")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.mainColor)
            }
        }
    }
}

struct HistoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryHeaderView(presentedDate: .constant(Date()))
            .background(Color.backgroundColor)
    }
}
