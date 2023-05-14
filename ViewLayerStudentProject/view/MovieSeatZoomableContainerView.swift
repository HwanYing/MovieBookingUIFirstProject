//
//  MovieSeatZoomableContainerView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/14.
//

import SwiftUI

struct MovieSeatZoomableContainerView: View {
    
    // Child View
    var view: AnyView? = nil
    var viewHeight: Double = 0.0
    
    @State private var zoomLevel: Double = 1.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    
    var body: some View {
        // Drag Gesturs
        let drag = DragGesture()
            .onChanged { value in
                if zoomLevel != 1 {
                    self.offset = CGSize(width: value.translation.width + self.lastOffset.width, height: value.translation.height + self.lastOffset.height)
                }
            }
            .onEnded { value in
                if zoomLevel != 1 {
                    self.offset = CGSize(width: value.translation.width + self.lastOffset.width, height: value.translation.height + self.lastOffset.height)
                    self.lastOffset = self.offset
                }
            }
        
        VStack(spacing: 0.0) {
            // Zoomable View
            view
                .scaledToFit()
                .scaleEffect(zoomLevel)
                .offset(x: offset.width, y: offset.height)
                .gesture(drag)
                .frame(width: UIScreen.main.bounds.width, height: viewHeight)
                .clipped()
            
            // Color Explanatin View
            SeatColorView()
            
            // Slider
            SliderView(zoomLevel: $zoomLevel, offset: $offset)
                .padding(.top, MARGIN_XLARGE)
            
            // Number of tickets, price and Buy Ticket Btn View
            TicketPriceAndBuyTicketBtnView()
            
        }
    }
}

struct MovieSeatZoomableContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSeatZoomableContainerView()
    }
}

// Seat Color View
struct SeatColorView: View {
    var body: some View{
        ZStack{
            HStack{
                SeatColorItemView(color: COLOR_WHITE, text: AVAILABLE)
                
                Spacer()
                
                SeatColorItemView(color: SUB_TEXT_COLOR, text: TAKEN)
                
                Spacer()
                
                SeatColorItemView(color: PRIMARY_COLOR, text: SELECTION)
            }
            .padding([.leading, .trailing], MARGIN_LARGE - 2)
        }
        .frame(height: MARGIN_XLARGE + MARGIN_SMALL + 1)
        .background(Color(SECTION_BG_COLOR))
    }
}

// Seat Color Available Item View
struct SeatColorItemView: View {
    
    var color: String = ""
    var text: String = ""
    
    var body: some View {
        HStack(spacing: MARGIN_MEDIUM_1) {
            Circle()
                .frame(width: MARGIN_MEDIUM, height: MARGIN_MEDIUM)
                .foregroundColor(Color(color))
                .overlay(Circle().stroke(Color(SUB_TEXT_COLOR), lineWidth: 1))
            
            Text(text)
                .foregroundColor(Color(SUB_TEXT_COLOR))
                .font(.system(size: MARGIN_MEDIUM_2))
        }
    }
}

// Slider View
struct SliderView: View {
    
    @Binding var zoomLevel: Double
    @Binding var offset: CGSize
    
    var body: some View{
        HStack {
            Text("-")
                .font(.system(size: MARGIN_MEDIUM_4))
                .foregroundColor(Color(SUB_TEXT_COLOR))
            
            Slider(value: Binding(get: {
                zoomLevel
            }, set: { newVal in
                zoomLevel = newVal
                offset = CGSize.zero
            }), in: 1...3, step: 0.1)
            .padding(.horizontal)
            .accentColor(Color(SUB_NOTE_COLOR))
            
            Text("+")
                .font(.system(size: MARGIN_MEDIUM_4))
                .foregroundColor(Color(SUB_TEXT_COLOR))
            
        }
        .padding([.leading, .trailing], MARGIN_XXLARGE)
    }
}

// Number of tickets, price and Buy Ticket button
struct TicketPriceAndBuyTicketBtnView: View {
    var body: some View{
        HStack(spacing: MARGIN_XLARGE - 4) {
            // number of tickets, price
            VStack {
                Text("2 Tickets")
                    .font(.system(size: MARGIN_MEDIUM_3))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Text("17000 Ks")
                    .font(.system(size: MARGIN_MEDIUM_4))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(PRIMARY_COLOR))
                
            }
            
            // Buy Ticket Button
            ZStack{
                Image(TICKET_BACKGROUND)
                    .resizable()
                    .frame(height: MARGIN_XXLARGE)
                
                Text("Buy Ticket")
                    .font(.system(size: MARGIN_MEDIUM_2))
                    .fontWeight(.semibold)
                    .frame(width: MARGIN_XBIG + MARGIN_MEDIUM, height: MARGIN_XXLARGE)
                    .background(Color(PRIMARY_COLOR))
                
            }
        }
        .padding(.top, MARGIN_XLARGE - 3)
        .padding([.leading, .trailing], MARGIN_XLARGE + MARGIN_SMALL)
    }
}
