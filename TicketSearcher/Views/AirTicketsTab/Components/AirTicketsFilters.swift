//
//  AirTicketsFilters.swift
//  TicketSearcher
//
//  Created by Roman on 4/6/24.
//

import SwiftUI

struct AirTicketsFilters: View {
    @EnvironmentObject var viewModel: AirTicketsVM

    // Back way
    @Binding var backDate: Date// = Date.init(timeIntervalSince1970: 0)
    @Binding var showBackDatePicker: Bool// = false

    // There way
    @Binding var thereDate: Date
    @Binding var showThereDatePicker: Bool// = false

    var thereDateText: (dayMonth: String, weekday: String) {
        viewModel.getDayMonthWeekdayFormat(date: thereDate)
    }

    var backDateText: (dayMonth: String, weekday: String)? {
        if backDate.timeIntervalSince1970 != 0 {
            return viewModel.getDayMonthWeekdayFormat(date: backDate)
        } else {
            return nil
        }
    }

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // There way
                filterItem(
                    icon: nil,
                    view: {
                        HStack(spacing: 0) {
                            Text(thereDateText.dayMonth)
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                            if !thereDateText.weekday.isEmpty {
                                Text(", \(thereDateText.weekday)")
                                    .fontTitle4()
                                    .foregroundStyle(Color.tsGrey6)
                            }
                        }
                    }()
                )
                .onTapGesture {
                    showThereDatePicker = true
                }

                // Back way
                filterItem(
                    icon: backDateText == nil ? AssetImage.returnTicketFilterIcon.image : nil,
                    view: {
                        HStack(spacing: 0) {
                            if let backDateText {
                                Text(backDateText.dayMonth)
                                    .fontTitle4()
                                    .foregroundStyle(Color.tsWhite)
                                if !backDateText.weekday.isEmpty {
                                    Text(", \(backDateText.weekday)")
                                        .fontTitle4()
                                        .foregroundStyle(Color.tsGrey6)
                                }
                            } else {
                                Text("Обратно")
                                    .fontTitle4()
                                    .foregroundStyle(Color.tsWhite)
                            }
                        }
                    }()
                )
                .onTapGesture {
                    if backDate.timeIntervalSince1970 == 0 {
                        backDate = Date.now
                    }
                    showBackDatePicker = true
                }

                filterItem(
                    icon: AssetImage.passengersFilterIcon.image,
                    view: {
                        Text("1, эконом")
                            .fontTitle4()
                            .foregroundStyle(Color.tsWhite)
                    }()
                )

                filterItem(
                    icon: AssetImage.filtersIcon.image,
                    view: {
                        Text("Фильтры")
                            .fontTitle4()
                            .foregroundStyle(Color.tsWhite)
                    }()
                )
            }
            .sheet(isPresented: $showThereDatePicker) {
                TickerDateSheet(selectedDate: $thereDate, showDatePicker: $showThereDatePicker)
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $showBackDatePicker) {
                TickerDateSheet(selectedDate: $backDate, showDatePicker: $showBackDatePicker)
                    .presentationDetents([.medium])
            }
        }
    }

    @ViewBuilder
    func filterItem<Content: View>(icon: Image?, view: Content) -> some View {
        HStack {
            if let icon {
                icon
                    .frame(height: 10)
            }
            view
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(Color.tsGrey3)
        .clipShape(RoundedRectangle(cornerRadius: 16), style: FillStyle())
    }
}

// MARK: - Preview
// #Preview {
//     AirTicketsFilters()
// }
