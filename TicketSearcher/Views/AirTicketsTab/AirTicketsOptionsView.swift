//
//  AirTicketsOptionsView.swift
//  TicketSearcher
//
//  Created by Roman on 5/6/24.
//

import SwiftUI

struct AirTicketsOptionsView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @EnvironmentObject var viewModel: AirTicketsVM
    @State var bottomMenuHeight: CGFloat = 0
    
    
    var thereDateText: (dayMonth: String, weekday: String) {
        viewModel.getDayMonthWeekdayFormat(date: viewModel.thereDate)
    }
    
    var backDateText: (dayMonth: String, weekday: String)? {
        if viewModel.backDate.timeIntervalSince1970 != 0 {
            return viewModel.getDayMonthWeekdayFormat(date: viewModel.backDate)
        } else {
            return nil
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        AssetImage.airTicketsOptionsBackButton.image
                            .frame(width: 14)
                            .onTapGesture {
                                appCoordinator.activeScreen = .airTicketsCountry
                            }

                        VStack(alignment: .leading) {
                            Text(viewModel.fromCity + "-" + viewModel.toCity)
                                .fontTitle3()
                                .foregroundStyle(Color.tsWhite)

                            HStack(spacing: 0) {
                                Text(thereDateText.dayMonth)
                                    .fontTitle3()
                                    .foregroundStyle(Color.tsGrey6)

                                if let backDateText {
                                    Text("-" + backDateText.dayMonth)
                                        .fontTitle3()
                                        .foregroundStyle(Color.tsGrey6)
                                }

                                Text(", 1 пассажир")
                                    .fontTitle3()
                                    .foregroundStyle(Color.tsGrey6)
                            }
                        }
                        .padding(.leading, 8)

                        Spacer(minLength: 0)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 5)
                }
                .background(Color.tsGrey3)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.tsGrey2),
                    alignment: .bottom
                )
                .padding(.top, 16)
                
                ScrollView(.vertical) {
                    ForEach(0..<viewModel.detailedTickets.count, id: \.self) { index in
                        AirTicketDetailView(detailedTicket: viewModel.detailedTickets[index])
                            .padding(.vertical, 6)
                            .modifier(ConditionalPaddingModifier(
                                condition: index == 0,
                                padding: .top,
                                value: 15
                            ))
                            .modifier(ConditionalPaddingModifier(
                                condition: index == viewModel.detailedTickets.count - 1,
                                padding: .bottom,
                                value: bottomMenuHeight + 15
                            ))
                    }
                }
            }
            .padding(.horizontal, 16)
            .onAppear {
                viewModel.getDetailedFlightData()
            }
            
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Button(action: {
                        print("Tap | Bottom menu Filter button")
                    }, label: {
                        Label(title: {
                            Text("График цен")
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                        }, icon: {
                            AssetImage.filtersIcon.image
                                .frame(width: 12)
                        })
                    })
                    
                    Button(action: {
                        print("Tap | Bottom menu Price chartbutton")
                    }, label: {
                        Label(title: {
                            Text("График цен")
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                        }, icon: {
                            AssetImage.airTicketsOptionsChartButton.image
                                .frame(width: 12)
                        })
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(Color.tsBlue)
                .clipShape(RoundedRectangle(cornerRadius: 50), style: FillStyle())
                .modifier(GetHeightModifier(height: $bottomMenuHeight))
            }
            .padding(.bottom, 10)
        }
        .background(Color.tsBlack)
    }
}

// MARK: - Preview
var testAirTicketsVM = AirTicketsVM.shared
#Preview("From and to dates") {
    VStack {
        AirTicketsOptionsView()
            .environmentObject(AppCoordinator())
            .environmentObject(AirTicketsVM.shared)
            .onAppear {
                testAirTicketsVM.fromCity = "МоскваТест"
                testAirTicketsVM.toCity = "Санкт-ПетербургТест"
                testAirTicketsVM.thereDate = Date.now
                testAirTicketsVM.backDate = Date.now + (60 * 60 * 72)
            }
    }.background(Color.black)
}
