//
//  SeatingPlanPageView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/14.
//

import SwiftUI

struct SeatingPlanPageView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            
            Color(BG_COLOR)
            
            VStack(spacing: 0.0) {
                // Appbar
                SeatingPlanAppBarView(){
                    presentation.wrappedValue.dismiss()
                }
                
                // Screen
                CinemaScreenView()
                    .padding(.top, MARGIN_MEDIUM_2)
                
                // Price
                Text(PRICE_NORMAL_TEXT)
                    .font(.system(size: MARGIN_MEDIUM_2))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(SUB_TEXT_COLOR))
                    .padding(.bottom, MARGIN_MEDIUM)
                
                // Movie Seat
                MovieSeatZoomableContainerView(view: AnyView(MovieSeatsView()), viewHeight: SEAT_VIEW_HEIGHT).padding([.leading, .trailing], MARGIN_SMALL)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarBackButtonHidden(true)
    }
}

struct SeatingPlanPageView_Previews: PreviewProvider {
    static var previews: some View {
        SeatingPlanPageView()
    }
}
// Appbar
struct SeatingPlanAppBarView: View {
    
    var onTapBack: () -> Void = {}
    
    var body: some View {
        HStack {
            Image(systemName: IC_CHEV_LEFT)
                .resizable()
                .frame(width: MARGIN_CARD_MEDIUM_2, height: MARGIN_LARGE - 2)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding([.leading, .trailing], MARGIN_MEDIUM_4)
        .padding(.top, MARGIN_XBIG - MARGIN_MEDIUM)
        .onTapGesture {
            onTapBack()
        }
    }
}

// Screen
struct CinemaScreenView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image(CINEMA_SCREEN_IMG)
                .resizable()
                .frame(width: CINEMA_SCREEN_WIDTH, height: CINEMA_SCREEN_HEIGHT)
                .clipped()
            
            Text(SCREEN_TEXT)
                .font(.system(size: MARGIN_MEDIUM_2))
                .foregroundColor(.white)
                .padding(.bottom, MARGIN_LARGE)
                .fontWeight(.semibold)
        }
    }
}

// Movie Seats Grid Section
struct MovieSeatsView: View {
    
    var columns = getGridItems(numberOfColumns: SEAT_COLUMNS_COUNT, spacing: SEAT_SPACING)
    
    var body: some View{
        LazyVGrid(columns: columns) {
            ForEach(dummySeats, id: \.id){ seat in
                MovieSeatItemView(seat: seat)
            }
        }
    }
}

// Movie Seat
struct MovieSeatItemView: View {
    
    var seat: MovieSeatsVO? = nil
    
    var body: some View {
        if seat?.isAvailable() ?? false{
            Image(CHAIR_WHITE)
                .resizable()
                .frame(width: MOVIE_SEAT_SIZE, height: MOVIE_SEAT_SIZE)
                .clipped()
        } else if seat?.isTaken() ?? false{
            Image(CHAIR_GRAY)
                .resizable()
                .frame(width: MOVIE_SEAT_SIZE, height: MOVIE_SEAT_SIZE)
                .clipped()
        } else if seat?.isText() ?? false{
            Text(seat?.text ?? "")
                .font(.system(size: MARGIN_CARD_MEDIUM_2))
                .frame(width: MOVIE_SEAT_SIZE, height: MOVIE_SEAT_SIZE)
                .foregroundColor(Color(SUB_TEXT_COLOR))
                .fontWeight(.semibold)
        } else {
            Color.clear
                .frame(width: MOVIE_SEAT_SIZE, height: MOVIE_SEAT_SIZE)
        }
    }
}
