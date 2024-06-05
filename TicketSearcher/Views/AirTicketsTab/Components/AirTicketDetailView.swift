//
//  AirTicketDetailView.swift
//  TicketSearcher
//
//  Created by Roman on 5/6/24.
//

import SwiftUI

struct AirTicketDetailView: View {
    @EnvironmentObject var viewModel: AirTicketsVM

    var detailedTicket: DetailedTicket

    var departureTime: String? {
        if let time = viewModel.getTime1970(dateString: detailedTicket.departure.date) {
            return time.formatted(date: .omitted, time: .shortened)
        } else {
            return nil
        }
    }
    var arrivalTime: String? {
        if let time = viewModel.getTime1970(dateString: detailedTicket.arrival.date) {
            return time.formatted(date: .omitted, time: .shortened)
        } else {
            return nil
        }
    }
    var wayTime: String? {
        if let arrivalTime = viewModel.getTime1970(dateString: detailedTicket.arrival.date),
           let departureTime = viewModel.getTime1970(dateString: detailedTicket.departure.date) {
            return viewModel.getHoursTimeIntervalForFlight(from: departureTime, to: arrivalTime)
        } else {
            return nil
        }
    }

    var body: some View {
        // ZStack {
        ZStack {
            VStack {
                HStack {
                    Text("\(detailedTicket.price.value.priceformatNumber()) ₽")
                        .fontTitle1()
                        .foregroundStyle(Color.tsWhite)
                    Spacer()
                }
                HStack {
                    AssetImage.ticketRedMarket.image
                    
                    HStack(alignment: .top, spacing: 4) {
                        VStack(spacing: 4) {
                            Text(departureTime ?? "-")
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                            
                            HStack {
                                Text(detailedTicket.departure.airport)
                                    .fontTitle4()
                                    .foregroundStyle(Color.tsGrey6)
                                    .lineLimit(1)
                            }
                        }
                        
                        VStack(spacing: 0) {
                            Text("-")
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                        }
                        
                        VStack(spacing: 4) {
                            Text(departureTime ?? "-")
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                            
                            HStack {
                                Text(detailedTicket.arrival.airport)
                                    .fontTitle4()
                                    .foregroundStyle(Color.tsGrey6)
                                    .lineLimit(1)
                            }
                        }
                        
                        HStack(spacing: 0) {
                            if let wayTime {
                                HStack {
                                    Text(wayTime + "ч в пути")
                                        .fontTitle4()
                                        .foregroundStyle(Color.tsWhite)
                                }
                            }
                            
                            Text("/")
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                                .padding(.horizontal, 5)
                            
                            HStack {
                                Text(detailedTicket.hasTransfer ? "С пересадками" : "Без пересадок")
                                    .fontTitle4()
                                    .foregroundStyle(Color.tsWhite)
                                    .lineLimit(1)
                                
                                Spacer(minLength: 0)
                            }
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.leading, 12)
                    }
                }
            }
            .padding(16)
            .background(Color.tsGrey3)
            .clipShape(RoundedRectangle(cornerRadius: 8), style: FillStyle())
            .layoutPriority(1)
            // .padding(.top, detailedTicket.badge != nil ? 16: 0)
            
            if let badge = detailedTicket.badge {
                VStack {
                    HStack {
                        VStack {
                            Text(badge)
                                .fontTitle4()
                                .foregroundStyle(Color.tsWhite)
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(Color.tsBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 50), style: FillStyle())

                        Spacer()
                    }
                    Spacer()
                }
                .padding(.top, -10)
            }

        }
    }
}

var previewDetailedTicket = DetailedTicket(
    id: 101,
    badge: "Самый удобный",
    price: Price(value: 9999),
    providerName: "На сайте Победа",
    company: "Победа",
    departure: FlightDetail(
        town: "Москва",
        date: "2024-02-23T04:00:00",
        airport: "VKO"
    ),
    arrival: FlightDetail(
        town: "Сочи",
        date: "2024-02-23T08:30:00",
        airport: "AER"
    ),
    hasTransfer: true,
    hasVisaTransfer: true,
    luggage: Luggage(hasLuggage: true, price: Price(value: 2550)),
    handLuggage: HandLuggage(hasHandLuggage: true, size: "36x30x27"),
    isReturnable: true,
    isExchangable: true
)
#Preview {
    // VStack {
    //     Spacer()

        AirTicketDetailView(detailedTicket: previewDetailedTicket)
            .environmentObject(AirTicketsVM.shared)
        
    //     Spacer()
    // }
}
