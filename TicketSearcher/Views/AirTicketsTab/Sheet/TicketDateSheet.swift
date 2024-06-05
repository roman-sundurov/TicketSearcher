//
//  TicketDateSheet.swift
//  TicketSearcher
//
//  Created by Roman on 4/6/24.
//

import SwiftUI

struct TickerDateSheet: View {
    @Binding var selectedDate: Date
    @Binding var showDatePicker: Bool

    var body: some View {
        VStack {
            DatePicker(
                "Select a date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()

            Button("Done") {
                showDatePicker = false
            }
            .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    TickerDateSheet(selectedDate: .constant(Date()), showDatePicker: .constant(true))
}
