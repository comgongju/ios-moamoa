//
//  DailyHistoryList.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/22.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct DailyHistoryList: View {
    var viewModel: CalendarItemViewModel
    
    private var section: some View {
        HStack(spacing: 15) {
            Spacer()
            if self.viewModel.dayTotalIncome > 0 {
                Text("+\(self.viewModel.dayTotalIncome)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.pinkredTextColor)
            }
            
            if self.viewModel.dayTotalSpending < 0 {
                Text("\(self.viewModel.dayTotalSpending)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.mainColor)
            }
        }
        .padding(.horizontal, 22)
        .padding(.top, 11)
        .padding(.bottom, 10)
        .background(Color.layerSectionColor)
    }
    
    private func createCell(_ itemViewModel: DailyHistoryModel) -> some View {
        HStack(spacing: 17) {
            HStack(spacing: 5) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 28, height: 28)
                        .foregroundColor(.layerSectionColor)
                    Text(itemViewModel.category.icon.rawValue)
                }
                Text(itemViewModel.category.title)
                    .lineLimit(1)
                    .frame(width: 60, alignment: .leading)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(itemViewModel.changeBudget > 0 ? .pinkredTextColor : .mainColor)
            }
            Text(itemViewModel.title)
                .font(.system(size: 14))
            Spacer()
            Text("\(itemViewModel.changeBudget > 0 ? "+" : "")\(itemViewModel.changeBudget)")
                .font(.system(size: 14))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            section
            ForEach(0..<self.viewModel.dayHistory.count) { i in
                self.createCell(self.viewModel.dayHistory[i])
                Divider()
            }
        }
    }
}

struct DailyHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        DailyHistoryList(viewModel: CalendarItemViewModel(date: Date()))
    }
}
