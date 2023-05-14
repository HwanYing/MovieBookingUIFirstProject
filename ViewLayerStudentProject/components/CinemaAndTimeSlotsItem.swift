//
//  CinemaAndTimeSlotsItem.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/12.
//

import SwiftUI

struct CinemaAndTimeSlotsItem: View {
    
    @State var timeSlotExpanding: Bool = false
    var place: String
    var placeId: Int = 1
    var isSeparatorShown: Bool = true
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 0) {
                // Name, See Details
                HStack {
                    Text(place)
                        .font(.system(size: MARGIN_MEDIUM_2))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(SEE_DETAILS)
                        .font(.system(size: MARGIN_MEDIUM_2))
                        .foregroundColor(Color(PRIMARY_COLOR))
                        .fontWeight(.bold)
                        .underline()
                        .onTapGesture {
                            timeSlotExpanding.toggle()
                        }
                }
                // Cinema Facility list
                CinemaFacilitiesListView()
                    .padding(.top, MARGIN_MEDIUM_4)
                
                // Time Slots and Hint
                if timeSlotExpanding {
                        VStack(alignment: .leading, spacing: 0) {
                            
                            TimeSlotsView()
                           
                            // Longpress hint
                            LongPressHintView()
                        }
                        .padding(.top, MARGIN_LARGE)
                } else {
                    EmptyView()
                }
                
            }
            .padding(EdgeInsets(top: MARGIN_XLARGE - 2, leading: MARGIN_LARGE, bottom: MARGIN_XLARGE - 2, trailing: MARGIN_LARGE))
            .onTapGesture {
                withAnimation {
                    timeSlotExpanding.toggle()
                }
            }
            // Separator
            if isSeparatorShown{
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(SUB_TEXT_COLOR))
                    .padding(.bottom, MARGIN_SMALL / 2)
            } else {
                EmptyView()
            }
        }
        .background(Color(BG_COLOR))
    }
}

struct CinemaAndTimeSlotsItem_Previews: PreviewProvider {
    static var previews: some View {
        CinemaAndTimeSlotsItem(place: "JCGV: Junction City")
            .background(Color(BG_COLOR))
    }
}
// Facilities Item
struct FacilityItemView: View {
    
    var image: String
    var text: String
    
    var body: some View {
        HStack(spacing: MARGIN_SMALL){
            Image(image)
                .resizable()
                .frame(width: MARGIN_MEDIUM_2, height: MARGIN_MEDIUM_2)
            
            Text(text)
                .font(.system(size: MARGIN_HALF_LARGE))
                .fontWeight(.medium)
                .foregroundColor(Color(FACILITY_TEXT_COLOR))
        }
    }
}
// Facility list
struct CinemaFacilitiesListView: View {
    var body: some View {
        HStack(spacing: MARGIN_MEDIUM_2){
            
            FacilityItemView(image: PARKING_IMG_GRAY, text: "Parking")
            FacilityItemView(image: ONLINE_FOOD_IMG_GRAY, text: "Online Food")
            FacilityItemView(image: WHEEL_CHAIR_IMG, text: "Wheel Chair")
        }
    }
}
// Time Slot Item
struct TimeSlotItemView: View {
    
    var time:  String
    var viewType: String
    var screen: String
    var availableCount: Int
    var borderColor: String
    var bgColor: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .background(Color(bgColor))
            
            VStack(alignment: .center, spacing: MARGIN_SMALL) {
                Text(time)
                    .font(.system(size: MARGIN_HALF_LARGE))
                
                Text(viewType)
                    .font(.system(size: MARGIN_CARD_MEDIUM_2))
                
                Text(screen)
                    .font(.system(size: MARGIN_CARD_MEDIUM_2))
                
                if borderColor != GREEN_LIGHT_COLOR {
                    
                    Text("\(availableCount) Available")
                        .font(.system(size: MARGIN_CARD_MEDIUM_2))
                }
               
            }
            .foregroundColor(availableCount == 21 && viewType == "3D" ? Color(SUB_TEXT_COLOR) : Color.white)
            .fontWeight(.medium)
            
        }
        .frame(width: TIME_SLOT_WIDTH, height: TIME_SLOT_HEIGHT)
        .overlay(RoundedRectangle(cornerRadius: MARGIN_SMALL).stroke(Color(borderColor), lineWidth: 1))
    }
}
// Long Press Hint
struct LongPressHintView: View {
    var body: some View {
        HStack(spacing: MARGIN_SMALL) {
            Image(systemName: IC_INFO_CIRCLE_FILL)
                .resizable()
                .frame(width: MARGIN_MEDIUM_2, height: MARGIN_MEDIUM_2)
                .foregroundColor(Color(FACILITY_TEXT_COLOR))
            
            
            Text("Long press on show timing to see seats class!")
                .font(.system(size: MARGIN_HALF_LARGE))
                .foregroundColor(Color(FACILITY_TEXT_COLOR))
                .fontWeight(.bold)
        }
        .padding(.top, MARGIN_LARGE)
    }
}
// Time Slots
struct TimeSlotsView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    let data : [TimeSlotVO] = cinemaSeatData
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(data, id: \.self) { item in
                // time slot item
                NavigationLink(value: item) {
                    TimeSlotItemView(time: item.time, viewType: item.viewType, screen: item.screen, availableCount: item.availableCount , borderColor: item.borderColor, bgColor: item.bgColor)
                }
                .buttonStyle(.plain)
            }
        }
    }
}
