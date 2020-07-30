//
//  CalendarDetailPagingView.swift
//  ios-moamoa
//
//  Created by Soojung Shin on 2020/07/30.
//  Copyright © 2020 comgongju. All rights reserved.
//

import SwiftUI

struct CalendarDetailPagingView: View {
    @State var presentedDate: Date
    @State var currentPage: Int = 1
    
    var body: some View {
        PagerView(pageCount: 3, currentIndex: self.$currentPage) {
            TupleView<(CalendarDetailView, CalendarDetailView, CalendarDetailView)>(
                (CalendarDetailView(presentedDate: .constant(self.presentedDate.previousDay), viewModel: CalendarItemViewModel(date: self.presentedDate)),
                CalendarDetailView(presentedDate: self.$presentedDate, viewModel: CalendarItemViewModel(date: self.presentedDate)),
                CalendarDetailView(presentedDate: .constant(self.presentedDate.nextDay), viewModel: CalendarItemViewModel(date: self.presentedDate)))
            )
        }
    }
}

struct CalendarDetailPagingView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetailPagingView(presentedDate: Date())
    }
}

extension TupleView: Pagable where T == (CalendarDetailView, CalendarDetailView, CalendarDetailView) {
    func actionNextPage() {
        value.1.actionNextPage()
    }
    
    func actionPreviousPage() {
        value.1.actionPreviousPage()
    }
}
