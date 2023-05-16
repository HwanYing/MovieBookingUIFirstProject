//
//  TicketView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/7.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            Color(BG_COLOR)
            
            VStack(alignment: .leading, spacing: 0) {
                // Appbar
                TicketAppBarView()
                
                TicketCardView()
                    .padding(.top, MARGIN_LARGE)
            }
        }
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}

struct TicketAppBarView: View {
    var body: some View {
        HStack(spacing: MARGIN_LARGE){
            
            Spacer()
            
            Image(systemName: IC_SEARCH)
                .resizable()
                .frame(width: TEXT_SMALL_HEADING, height: TEXT_SMALL_HEADING)
            
            Image(systemName: IC_NOTIFICATION)
                .resizable()
                .frame(width: MARGIN_MEDIUM_3, height: MARGIN_MEDIUM_4)
            
            Image(systemName: IC_SCAN_FINDER)
                .resizable()
                .frame(width: MARGIN_MEDIUM_4 + 1, height: MARGIN_MEDIUM_4 + 1)
        }
        .foregroundColor(.white)
        .fontWeight(.bold)
        .padding(.trailing, MARGIN_MEDIUM_4)
    }
}

struct TicketCardView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(BOOKING_BG_COLOR_2).opacity(0.4), Color(BOOKING_BG_COLOR_3).opacity(0.7), Color(SNACK_BG_COLOR)], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(alignment: .leading, spacing: 0.0){
                HStack{
                    Image(POSTER_IMAGE)
                        .resizable()
                        .frame(width: 96, height: 120)
                        .cornerRadius(MARGIN_SMALL)
                    
                    VStack(alignment: .leading,spacing: 0){
                        HStack {
                            Text(MOVIE_TITLE)
                                .font(.system(size: MARGIN_MEDIUM_2))
                                .foregroundColor(.white)
                            .fontWeight(.bold)
                            
                            Text("(\(MOVIE_WATCHING_TYPE))")
                                .font(.system(size: MARGIN_MEDIUM_2))
                                .foregroundColor(Color(SUB_NOTE_COLOR))
                                .padding([.leading, .trailing], -MARGIN_SMALL)
                            
                            Text("(\(MOVIE_RATING_CONTENT))")
                                .font(.system(size: MARGIN_MEDIUM_2))
                                .foregroundColor(Color(SUB_NOTE_COLOR))
                                .padding([.leading, .trailing], -MARGIN_SMALL)
                        }
                        
                        Text(CINEMA_NAME)
                            .font(.system(size: MARGIN_MEDIUM_2))
                            .foregroundColor(Color(PRIMARY_COLOR))
                            .fontWeight(.bold)
                        
                        
                        
                    }
                }
            }
        }
        .frame(width: 370, height: 304)
        .cornerRadius(MARGIN_MEDIUM)
        .padding([.leading, .trailing])
    }
}
