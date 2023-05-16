//
//  Enums.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/15.
//

import Foundation
import SwiftUI

//Create an `enum` so you can define your options
enum ViewOptionsRoute{
    case movieDetails
    case timeSlot
    case seatingPlan
    case snack
    case checkout
    case payment
    case paymentSuccess
    
    //Assign each case with a `View`
    @ViewBuilder
    var view: some View{
        switch self{
        case .movieDetails:
            AboutNSMovieView()
        case .timeSlot:
            TimeSlotScreenView()
        case .seatingPlan:
            SeatingPlanPageView()
        case .snack:
            GrabABiteView(grabAbite: .constant(true))
        case .checkout:
            CheckOutView()
        case .payment:
            PaymentPageVeiw()
        case .paymentSuccess:
            TicketInformationConfirmView()
  
        }
    }
}

