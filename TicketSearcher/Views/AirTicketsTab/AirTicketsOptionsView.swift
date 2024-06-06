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
            VStack {
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
                .padding(.top, 16)
                
                ScrollView(.vertical) {
                    ForEach(viewModel.detailedTickets, id: \.id) { detailedTicket in
                        AirTicketDetailView(detailedTicket: detailedTicket)
                            .padding(.top, 10)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, bottomMenuHeight + 15)
            .background(Color.tsBlack)
            .onAppear {
                viewModel.getDetailedFlightData()
            }
            
            VStack {
                Spacer()
                HStack {
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
        }
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
